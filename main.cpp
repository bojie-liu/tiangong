#include "mainwindow.h"
#include <QApplication>
#include <QtDebug>
#include <sstream>
#include <QFile>
#include <QDir>
#include <QTime>
#include <PythonQt.h>

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QByteArray localMsg = msg.toLocal8Bit();

    bool shouldLogToFile = true;
    if (shouldLogToFile) {
        std::stringstream ss;
        ss << static_cast<int>(type) << ": " << localMsg.constData() << " " << context.file << " " << context.line;
        QFile logFile(QDir::currentPath() + QDir::separator() + QTime::currentTime().toString());
        if (logFile.open(QFile::WriteOnly)) {
            QTextStream ts(&logFile);
            ts << ss.str().c_str();
        }
        logFile.close();
    }

    switch (type) {
    case QtDebugMsg:
        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtInfoMsg:
        fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtWarningMsg:
        fprintf(stderr, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtCriticalMsg:
        fprintf(stderr, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtFatalMsg:
        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    }
}

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
//    qInstallMessageHandler(myMessageOutput);

    // init PythonQt and Python itself
     PythonQt::init();
     // get a smart pointer to the __main__ module of the Python interpreter
     PythonQtObjectPtr context = PythonQt::self()->getMainModule();
     // add a QObject as variable of name "example" to the namespace of the __main__ module
//     PyExampleObject example;
//     context.addObject("example", &example);
//      do something
//     context.evalScript("print example");
     context.evalScript("def multiply(a,b):\n  return a*b;\n");
     QVariantList args;
     args << 42 << 47;
     QVariant result = context.call("multiply", args);
     qDebug() << result.toInt();
     qDebug() << "hello";

    MainWindow w;
    w.show();

    return a.exec();
}
