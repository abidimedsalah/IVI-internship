/****************************************************************************
** Meta object code from reading C++ file 'Ofono_bluetooth.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "Ofono_bluetooth.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Ofono_bluetooth.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.4.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Ofono_t {
    QByteArrayData data[6];
    char stringdata[33];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Ofono_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Ofono_t qt_meta_stringdata_Ofono = {
    {
QT_MOC_LITERAL(0, 0, 5), // "Ofono"
QT_MOC_LITERAL(1, 6, 4), // "call"
QT_MOC_LITERAL(2, 11, 0), // ""
QT_MOC_LITERAL(3, 12, 6), // "number"
QT_MOC_LITERAL(4, 19, 6), // "answer"
QT_MOC_LITERAL(5, 26, 6) // "cancel"

    },
    "Ofono\0call\0\0number\0answer\0cancel"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Ofono[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x02 /* Public */,
       4,    0,   32,    2, 0x02 /* Public */,
       5,    0,   33,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Int, QMetaType::QString,    3,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void Ofono::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Ofono *_t = static_cast<Ofono *>(_o);
        switch (_id) {
        case 0: { int _r = _t->call((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 1: _t->answer(); break;
        case 2: _t->cancel(); break;
        default: ;
        }
    }
}

const QMetaObject Ofono::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Ofono.data,
      qt_meta_data_Ofono,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Ofono::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Ofono::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Ofono.stringdata))
        return static_cast<void*>(const_cast< Ofono*>(this));
    return QObject::qt_metacast(_clname);
}

int Ofono::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
