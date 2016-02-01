/****************************************************************************
** Meta object code from reading C++ file 'media-bluetooth.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "media-bluetooth.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'media-bluetooth.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.4.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Media_t {
    QByteArrayData data[11];
    char stringdata[62];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Media_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Media_t qt_meta_stringdata_Media = {
    {
QT_MOC_LITERAL(0, 0, 5), // "Media"
QT_MOC_LITERAL(1, 6, 4), // "play"
QT_MOC_LITERAL(2, 11, 0), // ""
QT_MOC_LITERAL(3, 12, 5), // "pause"
QT_MOC_LITERAL(4, 18, 4), // "next"
QT_MOC_LITERAL(5, 23, 11), // "fastForward"
QT_MOC_LITERAL(6, 35, 4), // "prev"
QT_MOC_LITERAL(7, 40, 6), // "rewind"
QT_MOC_LITERAL(8, 47, 4), // "prop"
QT_MOC_LITERAL(9, 52, 4), // "call"
QT_MOC_LITERAL(10, 57, 4) // "etat"

    },
    "Media\0play\0\0pause\0next\0fastForward\0"
    "prev\0rewind\0prop\0call\0etat"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Media[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x02 /* Public */,
       3,    0,   60,    2, 0x02 /* Public */,
       4,    0,   61,    2, 0x02 /* Public */,
       5,    0,   62,    2, 0x02 /* Public */,
       6,    0,   63,    2, 0x02 /* Public */,
       7,    0,   64,    2, 0x02 /* Public */,
       8,    0,   65,    2, 0x02 /* Public */,
       9,    0,   66,    2, 0x02 /* Public */,
      10,    0,   67,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,

       0        // eod
};

void Media::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Media *_t = static_cast<Media *>(_o);
        switch (_id) {
        case 0: _t->play(); break;
        case 1: _t->pause(); break;
        case 2: _t->next(); break;
        case 3: _t->fastForward(); break;
        case 4: _t->prev(); break;
        case 5: _t->rewind(); break;
        case 6: { int _r = _t->prop();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 7: { int _r = _t->call();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 8: { int _r = _t->etat();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject Media::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Media.data,
      qt_meta_data_Media,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Media::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Media::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Media.stringdata))
        return static_cast<void*>(const_cast< Media*>(this));
    return QObject::qt_metacast(_clname);
}

int Media::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
