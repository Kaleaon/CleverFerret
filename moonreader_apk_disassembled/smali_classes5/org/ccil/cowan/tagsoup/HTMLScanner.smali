.class public Lorg/ccil/cowan/tagsoup/HTMLScanner;
.super Ljava/lang/Object;
.source "HTMLScanner.java"

# interfaces
.implements Lorg/ccil/cowan/tagsoup/Scanner;
.implements Lorg/xml/sax/Locator;


# static fields
.field private static final A_ADUP:I = 0x1

.field private static final A_ADUP_SAVE:I = 0x2

.field private static final A_ADUP_STAGC:I = 0x3

.field private static final A_ANAME:I = 0x4

.field private static final A_ANAME_ADUP:I = 0x5

.field private static final A_ANAME_ADUP_STAGC:I = 0x6

.field private static final A_AVAL:I = 0x7

.field private static final A_AVAL_STAGC:I = 0x8

.field private static final A_CDATA:I = 0x9

.field private static final A_CMNT:I = 0xa

.field private static final A_DECL:I = 0xb

.field private static final A_EMPTYTAG:I = 0xc

.field private static final A_ENTITY:I = 0xd

.field private static final A_ENTITY_START:I = 0xe

.field private static final A_ETAG:I = 0xf

.field private static final A_GI:I = 0x10

.field private static final A_GI_STAGC:I = 0x11

.field private static final A_LT:I = 0x12

.field private static final A_LT_PCDATA:I = 0x13

.field private static final A_MINUS:I = 0x14

.field private static final A_MINUS2:I = 0x15

.field private static final A_MINUS3:I = 0x16

.field private static final A_PCDATA:I = 0x17

.field private static final A_PI:I = 0x18

.field private static final A_PITARGET:I = 0x19

.field private static final A_PITARGET_PI:I = 0x1a

.field private static final A_SAVE:I = 0x1b

.field private static final A_SKIP:I = 0x1c

.field private static final A_SP:I = 0x1d

.field private static final A_STAGC:I = 0x1e

.field private static final A_UNGET:I = 0x1f

.field private static final A_UNSAVE_PCDATA:I = 0x20

.field private static final S_ANAME:I = 0x1

.field private static final S_APOS:I = 0x2

.field private static final S_AVAL:I = 0x3

.field private static final S_BB:I = 0x4

.field private static final S_BBC:I = 0x5

.field private static final S_BBCD:I = 0x6

.field private static final S_BBCDA:I = 0x7

.field private static final S_BBCDAT:I = 0x8

.field private static final S_BBCDATA:I = 0x9

.field private static final S_CDATA:I = 0xa

.field private static final S_CDATA2:I = 0xb

.field private static final S_CDSECT:I = 0xc

.field private static final S_CDSECT1:I = 0xd

.field private static final S_CDSECT2:I = 0xe

.field private static final S_COM:I = 0xf

.field private static final S_COM2:I = 0x10

.field private static final S_COM3:I = 0x11

.field private static final S_COM4:I = 0x12

.field private static final S_DECL:I = 0x13

.field private static final S_DECL2:I = 0x14

.field private static final S_DONE:I = 0x15

.field private static final S_EMPTYTAG:I = 0x16

.field private static final S_ENT:I = 0x17

.field private static final S_EQ:I = 0x18

.field private static final S_ETAG:I = 0x19

.field private static final S_GI:I = 0x1a

.field private static final S_NCR:I = 0x1b

.field private static final S_PCDATA:I = 0x1c

.field private static final S_PI:I = 0x1d

.field private static final S_PITARGET:I = 0x1e

.field private static final S_QUOT:I = 0x1f

.field private static final S_STAGC:I = 0x20

.field private static final S_TAG:I = 0x21

.field private static final S_TAGWS:I = 0x22

.field private static final S_XNCR:I = 0x23

.field private static final debug_actionnames:[Ljava/lang/String;

.field private static final debug_statenames:[Ljava/lang/String;

.field private static statetable:[I


# instance fields
.field private theCurrentColumn:I

.field private theCurrentLine:I

.field private theLastColumn:I

.field private theLastLine:I

.field theNextState:I

.field theOutputBuffer:[C

.field private thePublicid:Ljava/lang/String;

.field theSize:I

.field theState:I

.field private theSystemid:Ljava/lang/String;

.field theWinMap:[I


# direct methods
.method static constructor <clinit>()V
    .locals 47

    const/16 v0, 0x250

    .line 97
    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 98
    aput v2, v0, v1

    const/16 v1, 0x2f

    aput v1, v0, v2

    const/4 v1, 0x5

    const/4 v3, 0x2

    aput v1, v0, v3

    const/16 v1, 0x16

    const/4 v4, 0x3

    aput v1, v0, v4

    const/4 v1, 0x4

    .line 99
    aput v2, v0, v1

    const/4 v1, 0x5

    const/16 v5, 0x3d

    aput v5, v0, v1

    const/4 v1, 0x6

    const/4 v5, 0x4

    aput v5, v0, v1

    const/4 v1, 0x7

    aput v4, v0, v1

    const/16 v1, 0x8

    .line 100
    aput v2, v0, v1

    const/16 v5, 0x9

    const/16 v6, 0x3e

    aput v6, v0, v5

    const/4 v7, 0x6

    const/16 v8, 0xa

    aput v7, v0, v8

    const/16 v7, 0xb

    const/16 v9, 0x1c

    aput v9, v0, v7

    const/16 v7, 0xc

    .line 101
    aput v2, v0, v7

    const/16 v7, 0xe

    const/16 v10, 0x1b

    aput v10, v0, v7

    const/16 v7, 0xf

    aput v2, v0, v7

    const/16 v7, 0x10

    .line 102
    aput v2, v0, v7

    const/16 v11, 0x11

    const/4 v12, -0x1

    aput v12, v0, v11

    const/16 v11, 0x12

    const/4 v13, 0x6

    aput v13, v0, v11

    const/16 v11, 0x13

    const/16 v13, 0x15

    aput v13, v0, v11

    const/16 v14, 0x14

    .line 103
    aput v2, v0, v14

    const/16 v14, 0x20

    aput v14, v0, v13

    const/16 v15, 0x16

    const/16 v16, 0x4

    aput v16, v0, v15

    const/16 v15, 0x17

    const/16 v16, 0x18

    aput v16, v0, v15

    .line 104
    aput v2, v0, v16

    const/16 v15, 0x19

    aput v8, v0, v15

    const/16 v17, 0x4

    const/16 v18, 0x1a

    aput v17, v0, v18

    aput v16, v0, v10

    .line 105
    aput v2, v0, v9

    const/16 v17, 0x1d

    aput v5, v0, v17

    const/16 v19, 0x4

    const/16 v20, 0x1e

    aput v19, v0, v20

    const/16 v19, 0x1f

    aput v16, v0, v19

    .line 106
    aput v3, v0, v14

    const/16 v21, 0x27

    const/16 v22, 0x21

    aput v21, v0, v22

    const/16 v21, 0x7

    const/16 v23, 0x22

    aput v21, v0, v23

    const/16 v21, 0x23

    aput v23, v0, v21

    const/16 v21, 0x24

    .line 107
    aput v3, v0, v21

    const/16 v21, 0x26

    aput v10, v0, v21

    const/16 v21, 0x27

    aput v3, v0, v21

    const/16 v21, 0x28

    .line 108
    aput v3, v0, v21

    const/16 v21, 0x29

    aput v12, v0, v21

    const/16 v21, 0x2a

    aput v1, v0, v21

    const/16 v21, 0x2b

    aput v13, v0, v21

    const/16 v21, 0x2c

    .line 109
    aput v3, v0, v21

    const/16 v21, 0x2d

    aput v14, v0, v21

    const/16 v21, 0x2e

    aput v17, v0, v21

    const/16 v21, 0x2f

    aput v3, v0, v21

    const/16 v21, 0x30

    .line 110
    aput v3, v0, v21

    const/16 v21, 0x31

    aput v8, v0, v21

    const/16 v21, 0x32

    aput v17, v0, v21

    const/16 v21, 0x33

    aput v3, v0, v21

    const/16 v21, 0x34

    .line 111
    aput v3, v0, v21

    const/16 v21, 0x35

    aput v5, v0, v21

    const/16 v21, 0x36

    aput v17, v0, v21

    const/16 v21, 0x37

    aput v3, v0, v21

    const/16 v21, 0x38

    .line 112
    aput v4, v0, v21

    const/16 v21, 0x39

    const/16 v24, 0x27

    aput v24, v0, v21

    const/16 v21, 0x3a

    aput v9, v0, v21

    const/16 v21, 0x3b

    aput v3, v0, v21

    const/16 v21, 0x3c

    .line 113
    aput v4, v0, v21

    const/16 v21, 0x3d

    aput v23, v0, v21

    aput v9, v0, v6

    const/16 v21, 0x3f

    aput v19, v0, v21

    const/16 v21, 0x40

    .line 114
    aput v4, v0, v21

    const/16 v21, 0x41

    aput v6, v0, v21

    const/16 v21, 0x42

    aput v1, v0, v21

    const/16 v21, 0x43

    aput v9, v0, v21

    const/16 v21, 0x44

    .line 115
    aput v4, v0, v21

    const/16 v21, 0x46

    aput v10, v0, v21

    const/16 v21, 0x47

    aput v14, v0, v21

    const/16 v21, 0x48

    .line 116
    aput v4, v0, v21

    const/16 v21, 0x49

    aput v12, v0, v21

    const/16 v21, 0x4a

    aput v1, v0, v21

    const/16 v21, 0x4b

    aput v13, v0, v21

    const/16 v21, 0x4c

    .line 117
    aput v4, v0, v21

    const/16 v21, 0x4d

    aput v14, v0, v21

    const/16 v21, 0x4e

    aput v9, v0, v21

    const/16 v21, 0x4f

    aput v4, v0, v21

    const/16 v21, 0x50

    .line 118
    aput v4, v0, v21

    const/16 v21, 0x51

    aput v8, v0, v21

    const/16 v21, 0x52

    aput v9, v0, v21

    const/16 v21, 0x53

    aput v4, v0, v21

    const/16 v21, 0x54

    .line 119
    aput v4, v0, v21

    const/16 v21, 0x55

    aput v5, v0, v21

    const/16 v21, 0x56

    aput v9, v0, v21

    const/16 v21, 0x57

    aput v4, v0, v21

    const/16 v21, 0x58

    const/16 v24, 0x4

    .line 120
    aput v24, v0, v21

    const/16 v21, 0x59

    const/16 v24, 0x43

    aput v24, v0, v21

    const/16 v21, 0x5a

    aput v9, v0, v21

    const/16 v21, 0x5b

    const/16 v24, 0x5

    aput v24, v0, v21

    const/16 v21, 0x5c

    const/16 v24, 0x4

    .line 121
    aput v24, v0, v21

    const/16 v21, 0x5e

    aput v9, v0, v21

    const/16 v21, 0x5f

    aput v11, v0, v21

    const/16 v21, 0x60

    .line 122
    aput v24, v0, v21

    const/16 v21, 0x61

    aput v12, v0, v21

    const/16 v21, 0x62

    aput v9, v0, v21

    const/16 v21, 0x63

    aput v13, v0, v21

    const/16 v21, 0x64

    const/16 v24, 0x5

    .line 123
    aput v24, v0, v21

    const/16 v21, 0x65

    const/16 v24, 0x44

    aput v24, v0, v21

    const/16 v21, 0x66

    aput v9, v0, v21

    const/16 v21, 0x67

    const/16 v24, 0x6

    aput v24, v0, v21

    const/16 v21, 0x68

    const/16 v24, 0x5

    .line 124
    aput v24, v0, v21

    const/16 v21, 0x6a

    aput v9, v0, v21

    const/16 v21, 0x6b

    aput v11, v0, v21

    const/16 v21, 0x6c

    .line 125
    aput v24, v0, v21

    const/16 v21, 0x6d

    aput v12, v0, v21

    const/16 v21, 0x6e

    aput v9, v0, v21

    const/16 v21, 0x6f

    aput v13, v0, v21

    const/16 v21, 0x70

    const/16 v24, 0x6

    .line 126
    aput v24, v0, v21

    const/16 v21, 0x71

    const/16 v24, 0x41

    aput v24, v0, v21

    const/16 v21, 0x72

    aput v9, v0, v21

    const/16 v21, 0x73

    const/16 v24, 0x7

    aput v24, v0, v21

    const/16 v21, 0x74

    const/16 v24, 0x6

    .line 127
    aput v24, v0, v21

    const/16 v21, 0x76

    aput v9, v0, v21

    const/16 v21, 0x77

    aput v11, v0, v21

    const/16 v21, 0x78

    .line 128
    aput v24, v0, v21

    const/16 v21, 0x79

    aput v12, v0, v21

    const/16 v21, 0x7a

    aput v9, v0, v21

    const/16 v21, 0x7b

    aput v13, v0, v21

    const/16 v21, 0x7c

    const/16 v24, 0x7

    .line 129
    aput v24, v0, v21

    const/16 v21, 0x7d

    const/16 v24, 0x54

    aput v24, v0, v21

    const/16 v21, 0x7e

    aput v9, v0, v21

    const/16 v21, 0x7f

    aput v1, v0, v21

    const/16 v21, 0x80

    const/16 v24, 0x7

    .line 130
    aput v24, v0, v21

    const/16 v21, 0x82

    aput v9, v0, v21

    const/16 v21, 0x83

    aput v11, v0, v21

    const/16 v21, 0x84

    .line 131
    aput v24, v0, v21

    const/16 v21, 0x85

    aput v12, v0, v21

    const/16 v21, 0x86

    aput v9, v0, v21

    const/16 v21, 0x87

    aput v13, v0, v21

    const/16 v21, 0x88

    .line 132
    aput v1, v0, v21

    const/16 v21, 0x89

    const/16 v24, 0x41

    aput v24, v0, v21

    const/16 v21, 0x8a

    aput v9, v0, v21

    const/16 v21, 0x8b

    aput v5, v0, v21

    const/16 v21, 0x8c

    .line 133
    aput v1, v0, v21

    const/16 v21, 0x8e

    aput v9, v0, v21

    const/16 v21, 0x8f

    aput v11, v0, v21

    const/16 v21, 0x90

    .line 134
    aput v1, v0, v21

    const/16 v21, 0x91

    aput v12, v0, v21

    const/16 v21, 0x92

    aput v9, v0, v21

    const/16 v21, 0x93

    aput v13, v0, v21

    const/16 v21, 0x94

    .line 135
    aput v5, v0, v21

    const/16 v21, 0x95

    const/16 v24, 0x5b

    aput v24, v0, v21

    const/16 v21, 0x96

    aput v9, v0, v21

    const/16 v21, 0x97

    const/16 v24, 0xc

    aput v24, v0, v21

    const/16 v21, 0x98

    .line 136
    aput v5, v0, v21

    const/16 v21, 0x9a

    aput v9, v0, v21

    const/16 v21, 0x9b

    aput v11, v0, v21

    const/16 v21, 0x9c

    .line 137
    aput v5, v0, v21

    const/16 v21, 0x9d

    aput v12, v0, v21

    const/16 v21, 0x9e

    aput v9, v0, v21

    const/16 v21, 0x9f

    aput v13, v0, v21

    const/16 v21, 0xa0

    .line 138
    aput v8, v0, v21

    const/16 v21, 0xa1

    const/16 v24, 0x3c

    aput v24, v0, v21

    const/16 v21, 0xa2

    aput v10, v0, v21

    const/16 v21, 0xa3

    const/16 v24, 0xb

    aput v24, v0, v21

    const/16 v21, 0xa4

    .line 139
    aput v8, v0, v21

    const/16 v21, 0xa6

    aput v10, v0, v21

    const/16 v21, 0xa7

    aput v8, v0, v21

    const/16 v21, 0xa8

    .line 140
    aput v8, v0, v21

    const/16 v21, 0xa9

    aput v12, v0, v21

    const/16 v21, 0xaa

    const/16 v24, 0x17

    aput v24, v0, v21

    const/16 v21, 0xab

    aput v13, v0, v21

    const/16 v21, 0xac

    const/16 v24, 0xb

    .line 141
    aput v24, v0, v21

    const/16 v21, 0xad

    const/16 v24, 0x2f

    aput v24, v0, v21

    const/16 v21, 0xae

    aput v14, v0, v21

    const/16 v21, 0xaf

    aput v15, v0, v21

    const/16 v21, 0xb0

    const/16 v24, 0xb

    .line 142
    aput v24, v0, v21

    const/16 v21, 0xb2

    aput v10, v0, v21

    const/16 v21, 0xb3

    aput v8, v0, v21

    const/16 v21, 0xb4

    .line 143
    aput v24, v0, v21

    const/16 v21, 0xb5

    aput v12, v0, v21

    const/16 v21, 0xb6

    aput v14, v0, v21

    const/16 v21, 0xb7

    aput v13, v0, v21

    const/16 v21, 0xb8

    const/16 v24, 0xc

    .line 144
    aput v24, v0, v21

    const/16 v21, 0xb9

    const/16 v24, 0x5d

    aput v24, v0, v21

    const/16 v21, 0xba

    aput v10, v0, v21

    const/16 v21, 0xbb

    const/16 v24, 0xd

    aput v24, v0, v21

    const/16 v21, 0xbc

    const/16 v24, 0xc

    .line 145
    aput v24, v0, v21

    const/16 v21, 0xbe

    aput v10, v0, v21

    const/16 v21, 0xbf

    aput v24, v0, v21

    const/16 v21, 0xc0

    .line 146
    aput v24, v0, v21

    const/16 v21, 0xc1

    aput v12, v0, v21

    const/16 v21, 0xc2

    aput v9, v0, v21

    const/16 v21, 0xc3

    aput v13, v0, v21

    const/16 v21, 0xc4

    const/16 v24, 0xd

    .line 147
    aput v24, v0, v21

    const/16 v21, 0xc5

    const/16 v24, 0x5d

    aput v24, v0, v21

    const/16 v21, 0xc6

    aput v10, v0, v21

    const/16 v21, 0xc7

    const/16 v24, 0xe

    aput v24, v0, v21

    const/16 v21, 0xc8

    const/16 v24, 0xd

    .line 148
    aput v24, v0, v21

    const/16 v21, 0xca

    aput v10, v0, v21

    const/16 v21, 0xcb

    const/16 v24, 0xc

    aput v24, v0, v21

    const/16 v21, 0xcc

    const/16 v24, 0xd

    .line 149
    aput v24, v0, v21

    const/16 v21, 0xcd

    aput v12, v0, v21

    const/16 v21, 0xce

    aput v9, v0, v21

    const/16 v21, 0xcf

    aput v13, v0, v21

    const/16 v21, 0xd0

    const/16 v24, 0xe

    .line 150
    aput v24, v0, v21

    const/16 v21, 0xd1

    aput v6, v0, v21

    const/16 v21, 0xd2

    aput v5, v0, v21

    const/16 v21, 0xd3

    aput v9, v0, v21

    const/16 v21, 0xd4

    .line 151
    aput v24, v0, v21

    const/16 v21, 0xd6

    aput v10, v0, v21

    const/16 v21, 0xd7

    const/16 v24, 0xc

    aput v24, v0, v21

    const/16 v21, 0xd8

    const/16 v24, 0xe

    .line 152
    aput v24, v0, v21

    const/16 v21, 0xd9

    aput v12, v0, v21

    const/16 v21, 0xda

    aput v9, v0, v21

    const/16 v21, 0xdb

    aput v13, v0, v21

    const/16 v21, 0xdc

    const/16 v24, 0xf

    .line 153
    aput v24, v0, v21

    const/16 v21, 0xdd

    const/16 v24, 0x2d

    aput v24, v0, v21

    const/16 v21, 0xde

    aput v9, v0, v21

    const/16 v21, 0xdf

    aput v7, v0, v21

    const/16 v21, 0xe0

    const/16 v24, 0xf

    .line 154
    aput v24, v0, v21

    const/16 v21, 0xe2

    aput v10, v0, v21

    const/16 v21, 0xe3

    aput v7, v0, v21

    const/16 v21, 0xe4

    .line 155
    aput v24, v0, v21

    const/16 v21, 0xe5

    aput v12, v0, v21

    const/16 v21, 0xe6

    aput v8, v0, v21

    const/16 v21, 0xe7

    aput v13, v0, v21

    const/16 v21, 0xe8

    .line 156
    aput v7, v0, v21

    const/16 v21, 0xe9

    const/16 v24, 0x2d

    aput v24, v0, v21

    const/16 v21, 0xea

    aput v9, v0, v21

    const/16 v21, 0xeb

    const/16 v24, 0x11

    aput v24, v0, v21

    const/16 v21, 0xec

    .line 157
    aput v7, v0, v21

    const/16 v21, 0xee

    aput v10, v0, v21

    const/16 v21, 0xef

    aput v7, v0, v21

    const/16 v21, 0xf0

    .line 158
    aput v7, v0, v21

    const/16 v21, 0xf1

    aput v12, v0, v21

    const/16 v21, 0xf2

    aput v8, v0, v21

    const/16 v21, 0xf3

    aput v13, v0, v21

    const/16 v21, 0xf4

    .line 159
    aput v24, v0, v21

    const/16 v21, 0xf5

    const/16 v24, 0x2d

    aput v24, v0, v21

    const/16 v21, 0xf6

    aput v9, v0, v21

    const/16 v21, 0xf7

    const/16 v24, 0x12

    aput v24, v0, v21

    const/16 v21, 0xf8

    const/16 v24, 0x11

    .line 160
    aput v24, v0, v21

    const/16 v21, 0xfa

    const/16 v24, 0x14

    aput v24, v0, v21

    const/16 v21, 0xfb

    aput v7, v0, v21

    const/16 v21, 0xfc

    const/16 v24, 0x11

    .line 161
    aput v24, v0, v21

    const/16 v21, 0xfd

    aput v12, v0, v21

    const/16 v21, 0xfe

    aput v8, v0, v21

    const/16 v21, 0xff

    aput v13, v0, v21

    const/16 v21, 0x100

    const/16 v24, 0x12

    .line 162
    aput v24, v0, v21

    const/16 v21, 0x101

    const/16 v24, 0x2d

    aput v24, v0, v21

    const/16 v21, 0x102

    const/16 v24, 0x16

    aput v24, v0, v21

    const/16 v21, 0x103

    const/16 v24, 0x12

    aput v24, v0, v21

    const/16 v21, 0x104

    .line 163
    aput v24, v0, v21

    const/16 v21, 0x105

    aput v6, v0, v21

    const/16 v21, 0x106

    aput v8, v0, v21

    const/16 v21, 0x107

    aput v9, v0, v21

    const/16 v21, 0x108

    .line 164
    aput v24, v0, v21

    const/16 v21, 0x10a

    aput v13, v0, v21

    const/16 v21, 0x10b

    aput v7, v0, v21

    const/16 v21, 0x10c

    .line 165
    aput v24, v0, v21

    const/16 v21, 0x10d

    aput v12, v0, v21

    const/16 v21, 0x10e

    aput v8, v0, v21

    const/16 v21, 0x10f

    aput v13, v0, v21

    const/16 v21, 0x110

    .line 166
    aput v11, v0, v21

    const/16 v21, 0x111

    const/16 v24, 0x2d

    aput v24, v0, v21

    const/16 v21, 0x112

    aput v9, v0, v21

    const/16 v21, 0x113

    const/16 v24, 0xf

    aput v24, v0, v21

    const/16 v21, 0x114

    .line 167
    aput v11, v0, v21

    const/16 v21, 0x115

    const/16 v24, 0x5b

    aput v24, v0, v21

    const/16 v21, 0x116

    aput v9, v0, v21

    const/16 v21, 0x117

    const/16 v24, 0x4

    aput v24, v0, v21

    const/16 v21, 0x118

    .line 168
    aput v11, v0, v21

    const/16 v21, 0x119

    aput v6, v0, v21

    const/16 v21, 0x11a

    aput v9, v0, v21

    const/16 v21, 0x11b

    aput v9, v0, v21

    const/16 v21, 0x11c

    .line 169
    aput v11, v0, v21

    const/16 v21, 0x11e

    aput v10, v0, v21

    const/16 v21, 0x11f

    const/16 v24, 0x14

    aput v24, v0, v21

    const/16 v21, 0x120

    .line 170
    aput v11, v0, v21

    const/16 v21, 0x121

    aput v12, v0, v21

    const/16 v21, 0x122

    aput v9, v0, v21

    const/16 v21, 0x123

    aput v13, v0, v21

    const/16 v21, 0x124

    .line 171
    aput v24, v0, v21

    const/16 v21, 0x125

    aput v6, v0, v21

    const/16 v21, 0x126

    const/16 v24, 0xb

    aput v24, v0, v21

    const/16 v21, 0x127

    aput v9, v0, v21

    const/16 v21, 0x128

    const/16 v24, 0x14

    .line 172
    aput v24, v0, v21

    const/16 v21, 0x12a

    aput v10, v0, v21

    const/16 v21, 0x12b

    aput v24, v0, v21

    const/16 v21, 0x12c

    .line 173
    aput v24, v0, v21

    const/16 v21, 0x12d

    aput v12, v0, v21

    const/16 v21, 0x12e

    aput v9, v0, v21

    const/16 v21, 0x12f

    aput v13, v0, v21

    const/16 v21, 0x130

    const/16 v24, 0x16

    .line 174
    aput v24, v0, v21

    const/16 v21, 0x131

    aput v6, v0, v21

    const/16 v21, 0x132

    const/16 v24, 0xc

    aput v24, v0, v21

    const/16 v21, 0x133

    aput v9, v0, v21

    const/16 v21, 0x134

    const/16 v24, 0x16

    .line 175
    aput v24, v0, v21

    const/16 v21, 0x136

    aput v10, v0, v21

    const/16 v21, 0x137

    aput v2, v0, v21

    const/16 v21, 0x138

    .line 176
    aput v24, v0, v21

    const/16 v21, 0x139

    aput v14, v0, v21

    const/16 v21, 0x13a

    aput v9, v0, v21

    const/16 v21, 0x13b

    aput v23, v0, v21

    const/16 v21, 0x13c

    .line 177
    aput v24, v0, v21

    const/16 v21, 0x13d

    aput v8, v0, v21

    const/16 v21, 0x13e

    aput v9, v0, v21

    const/16 v21, 0x13f

    aput v23, v0, v21

    const/16 v21, 0x140

    .line 178
    aput v24, v0, v21

    const/16 v21, 0x141

    aput v5, v0, v21

    const/16 v21, 0x142

    aput v9, v0, v21

    const/16 v21, 0x143

    aput v23, v0, v21

    const/16 v21, 0x144

    const/16 v24, 0x17

    .line 179
    aput v24, v0, v21

    const/16 v21, 0x146

    const/16 v24, 0xd

    aput v24, v0, v21

    const/16 v21, 0x147

    const/16 v24, 0x17

    aput v24, v0, v21

    const/16 v21, 0x148

    .line 180
    aput v24, v0, v21

    const/16 v21, 0x149

    aput v12, v0, v21

    const/16 v21, 0x14a

    const/16 v24, 0xd

    aput v24, v0, v21

    const/16 v21, 0x14b

    aput v13, v0, v21

    const/16 v21, 0x14c

    .line 181
    aput v16, v0, v21

    const/16 v21, 0x14d

    const/16 v24, 0x3d

    aput v24, v0, v21

    const/16 v21, 0x14e

    aput v9, v0, v21

    const/16 v21, 0x14f

    aput v4, v0, v21

    const/16 v21, 0x150

    .line 182
    aput v16, v0, v21

    const/16 v21, 0x151

    aput v6, v0, v21

    const/16 v21, 0x152

    aput v4, v0, v21

    const/16 v21, 0x153

    aput v9, v0, v21

    const/16 v21, 0x154

    .line 183
    aput v16, v0, v21

    const/16 v21, 0x156

    aput v3, v0, v21

    const/16 v3, 0x157

    aput v2, v0, v3

    const/16 v3, 0x158

    .line 184
    aput v16, v0, v3

    const/16 v3, 0x159

    aput v12, v0, v3

    const/16 v3, 0x15a

    aput v4, v0, v3

    const/16 v3, 0x15b

    aput v13, v0, v3

    const/16 v3, 0x15c

    .line 185
    aput v16, v0, v3

    const/16 v3, 0x15d

    aput v14, v0, v3

    const/16 v3, 0x15e

    aput v9, v0, v3

    const/16 v3, 0x15f

    aput v16, v0, v3

    const/16 v3, 0x160

    .line 186
    aput v16, v0, v3

    const/16 v3, 0x161

    aput v8, v0, v3

    const/16 v3, 0x162

    aput v9, v0, v3

    const/16 v3, 0x163

    aput v16, v0, v3

    const/16 v3, 0x164

    .line 187
    aput v16, v0, v3

    const/16 v3, 0x165

    aput v5, v0, v3

    const/16 v3, 0x166

    aput v9, v0, v3

    const/16 v3, 0x167

    aput v16, v0, v3

    const/16 v3, 0x168

    .line 188
    aput v15, v0, v3

    const/16 v3, 0x169

    aput v6, v0, v3

    const/16 v3, 0x16a

    const/16 v4, 0xf

    aput v4, v0, v3

    const/16 v3, 0x16b

    aput v9, v0, v3

    const/16 v3, 0x16c

    .line 189
    aput v15, v0, v3

    const/16 v3, 0x16e

    aput v10, v0, v3

    const/16 v3, 0x16f

    aput v15, v0, v3

    const/16 v3, 0x170

    .line 190
    aput v15, v0, v3

    const/16 v3, 0x171

    aput v12, v0, v3

    const/16 v3, 0x172

    aput v4, v0, v3

    const/16 v3, 0x173

    aput v13, v0, v3

    const/16 v3, 0x174

    .line 191
    aput v15, v0, v3

    const/16 v3, 0x175

    aput v14, v0, v3

    const/16 v3, 0x176

    aput v9, v0, v3

    const/16 v3, 0x177

    aput v15, v0, v3

    const/16 v3, 0x178

    .line 192
    aput v15, v0, v3

    const/16 v3, 0x179

    aput v8, v0, v3

    const/16 v3, 0x17a

    aput v9, v0, v3

    const/16 v3, 0x17b

    aput v15, v0, v3

    const/16 v3, 0x17c

    .line 193
    aput v15, v0, v3

    const/16 v3, 0x17d

    aput v5, v0, v3

    const/16 v3, 0x17e

    aput v9, v0, v3

    const/16 v3, 0x17f

    aput v15, v0, v3

    const/16 v3, 0x180

    .line 194
    aput v18, v0, v3

    const/16 v3, 0x181

    const/16 v4, 0x2f

    aput v4, v0, v3

    const/16 v3, 0x182

    aput v9, v0, v3

    const/16 v3, 0x183

    const/16 v4, 0x16

    aput v4, v0, v3

    const/16 v3, 0x184

    .line 195
    aput v18, v0, v3

    const/16 v3, 0x185

    aput v6, v0, v3

    const/16 v3, 0x186

    const/16 v4, 0x11

    aput v4, v0, v3

    const/16 v3, 0x187

    aput v9, v0, v3

    const/16 v3, 0x188

    .line 196
    aput v18, v0, v3

    const/16 v3, 0x18a

    aput v10, v0, v3

    const/16 v3, 0x18b

    aput v18, v0, v3

    const/16 v3, 0x18c

    .line 197
    aput v18, v0, v3

    const/16 v3, 0x18d

    aput v12, v0, v3

    const/16 v3, 0x18e

    aput v9, v0, v3

    const/16 v3, 0x18f

    aput v13, v0, v3

    const/16 v3, 0x190

    .line 198
    aput v18, v0, v3

    const/16 v3, 0x191

    aput v14, v0, v3

    const/16 v3, 0x192

    aput v7, v0, v3

    const/16 v3, 0x193

    aput v23, v0, v3

    const/16 v3, 0x194

    .line 199
    aput v18, v0, v3

    const/16 v3, 0x195

    aput v8, v0, v3

    const/16 v3, 0x196

    aput v7, v0, v3

    const/16 v3, 0x197

    aput v23, v0, v3

    const/16 v3, 0x198

    .line 200
    aput v18, v0, v3

    const/16 v3, 0x199

    aput v5, v0, v3

    const/16 v3, 0x19a

    aput v7, v0, v3

    const/16 v3, 0x19b

    aput v23, v0, v3

    const/16 v3, 0x19c

    .line 201
    aput v10, v0, v3

    const/16 v3, 0x19e

    const/16 v4, 0xd

    aput v4, v0, v3

    const/16 v3, 0x19f

    aput v10, v0, v3

    const/16 v3, 0x1a0

    .line 202
    aput v10, v0, v3

    const/16 v3, 0x1a1

    aput v12, v0, v3

    const/16 v3, 0x1a2

    aput v4, v0, v3

    const/16 v3, 0x1a3

    aput v13, v0, v3

    const/16 v3, 0x1a4

    .line 203
    aput v9, v0, v3

    const/16 v3, 0x1a5

    const/16 v4, 0x26

    aput v4, v0, v3

    const/16 v3, 0x1a6

    const/16 v4, 0xe

    aput v4, v0, v3

    const/16 v3, 0x1a7

    const/16 v4, 0x17

    aput v4, v0, v3

    const/16 v3, 0x1a8

    .line 204
    aput v9, v0, v3

    const/16 v3, 0x1a9

    const/16 v4, 0x3c

    aput v4, v0, v3

    const/16 v3, 0x1aa

    const/16 v4, 0x17

    aput v4, v0, v3

    const/16 v3, 0x1ab

    aput v22, v0, v3

    const/16 v3, 0x1ac

    .line 205
    aput v9, v0, v3

    const/16 v3, 0x1ae

    aput v10, v0, v3

    const/16 v3, 0x1af

    aput v9, v0, v3

    const/16 v3, 0x1b0

    .line 206
    aput v9, v0, v3

    const/16 v3, 0x1b1

    aput v12, v0, v3

    const/16 v3, 0x1b2

    aput v4, v0, v3

    const/16 v3, 0x1b3

    aput v13, v0, v3

    const/16 v3, 0x1b4

    .line 207
    aput v17, v0, v3

    const/16 v3, 0x1b5

    aput v6, v0, v3

    const/16 v3, 0x1b6

    aput v16, v0, v3

    const/16 v3, 0x1b7

    aput v9, v0, v3

    const/16 v3, 0x1b8

    .line 208
    aput v17, v0, v3

    const/16 v3, 0x1ba

    aput v10, v0, v3

    const/16 v3, 0x1bb

    aput v17, v0, v3

    const/16 v3, 0x1bc

    .line 209
    aput v17, v0, v3

    const/16 v3, 0x1bd

    aput v12, v0, v3

    const/16 v3, 0x1be

    aput v16, v0, v3

    const/16 v3, 0x1bf

    aput v13, v0, v3

    const/16 v3, 0x1c0

    .line 210
    aput v20, v0, v3

    const/16 v3, 0x1c1

    aput v6, v0, v3

    const/16 v3, 0x1c2

    aput v18, v0, v3

    const/16 v3, 0x1c3

    aput v9, v0, v3

    const/16 v3, 0x1c4

    .line 211
    aput v20, v0, v3

    const/16 v3, 0x1c6

    aput v10, v0, v3

    const/16 v3, 0x1c7

    aput v20, v0, v3

    const/16 v3, 0x1c8

    .line 212
    aput v20, v0, v3

    const/16 v3, 0x1c9

    aput v12, v0, v3

    const/16 v3, 0x1ca

    aput v18, v0, v3

    const/16 v3, 0x1cb

    aput v13, v0, v3

    const/16 v3, 0x1cc

    .line 213
    aput v20, v0, v3

    const/16 v3, 0x1cd

    aput v14, v0, v3

    const/16 v3, 0x1ce

    aput v15, v0, v3

    const/16 v3, 0x1cf

    aput v17, v0, v3

    const/16 v3, 0x1d0

    .line 214
    aput v20, v0, v3

    const/16 v3, 0x1d1

    aput v8, v0, v3

    const/16 v3, 0x1d2

    aput v15, v0, v3

    const/16 v3, 0x1d3

    aput v17, v0, v3

    const/16 v3, 0x1d4

    .line 215
    aput v20, v0, v3

    const/16 v3, 0x1d5

    aput v5, v0, v3

    const/16 v3, 0x1d6

    aput v15, v0, v3

    const/16 v3, 0x1d7

    aput v17, v0, v3

    const/16 v3, 0x1d8

    .line 216
    aput v19, v0, v3

    const/16 v3, 0x1d9

    aput v23, v0, v3

    const/16 v3, 0x1da

    const/4 v4, 0x7

    aput v4, v0, v3

    const/16 v3, 0x1db

    aput v23, v0, v3

    const/16 v3, 0x1dc

    .line 217
    aput v19, v0, v3

    const/16 v3, 0x1de

    aput v10, v0, v3

    const/16 v3, 0x1df

    aput v19, v0, v3

    const/16 v3, 0x1e0

    .line 218
    aput v19, v0, v3

    const/16 v3, 0x1e1

    aput v12, v0, v3

    const/16 v3, 0x1e2

    aput v1, v0, v3

    const/16 v3, 0x1e3

    aput v13, v0, v3

    const/16 v3, 0x1e4

    .line 219
    aput v19, v0, v3

    const/16 v3, 0x1e5

    aput v14, v0, v3

    const/16 v3, 0x1e6

    aput v17, v0, v3

    const/16 v3, 0x1e7

    aput v19, v0, v3

    const/16 v3, 0x1e8

    .line 220
    aput v19, v0, v3

    const/16 v3, 0x1e9

    aput v8, v0, v3

    const/16 v3, 0x1ea

    aput v17, v0, v3

    const/16 v3, 0x1eb

    aput v19, v0, v3

    const/16 v3, 0x1ec

    .line 221
    aput v19, v0, v3

    const/16 v3, 0x1ed

    aput v5, v0, v3

    const/16 v3, 0x1ee

    aput v17, v0, v3

    const/16 v3, 0x1ef

    aput v19, v0, v3

    const/16 v3, 0x1f0

    .line 222
    aput v14, v0, v3

    const/16 v3, 0x1f1

    aput v6, v0, v3

    const/16 v3, 0x1f2

    aput v1, v0, v3

    const/16 v3, 0x1f3

    aput v9, v0, v3

    const/16 v3, 0x1f4

    .line 223
    aput v14, v0, v3

    const/16 v3, 0x1f6

    aput v10, v0, v3

    const/16 v3, 0x1f7

    aput v14, v0, v3

    const/16 v3, 0x1f8

    .line 224
    aput v14, v0, v3

    const/16 v3, 0x1f9

    aput v12, v0, v3

    const/16 v3, 0x1fa

    aput v1, v0, v3

    const/16 v1, 0x1fb

    aput v13, v0, v1

    const/16 v1, 0x1fc

    .line 225
    aput v14, v0, v1

    const/16 v1, 0x1fd

    aput v14, v0, v1

    const/16 v1, 0x1fe

    const/4 v3, 0x7

    aput v3, v0, v1

    const/16 v1, 0x1ff

    aput v23, v0, v1

    const/16 v1, 0x200

    .line 226
    aput v14, v0, v1

    const/16 v1, 0x201

    aput v8, v0, v1

    const/16 v1, 0x202

    aput v3, v0, v1

    const/16 v1, 0x203

    aput v23, v0, v1

    const/16 v1, 0x204

    .line 227
    aput v14, v0, v1

    const/16 v1, 0x205

    aput v5, v0, v1

    const/16 v1, 0x206

    aput v3, v0, v1

    const/16 v1, 0x207

    aput v23, v0, v1

    const/16 v1, 0x208

    .line 228
    aput v22, v0, v1

    const/16 v1, 0x209

    aput v22, v0, v1

    const/16 v1, 0x20a

    aput v9, v0, v1

    const/16 v1, 0x20b

    aput v11, v0, v1

    const/16 v1, 0x20c

    .line 229
    aput v22, v0, v1

    const/16 v1, 0x20d

    const/16 v3, 0x3f

    aput v3, v0, v1

    const/16 v1, 0x20e

    aput v9, v0, v1

    const/16 v1, 0x20f

    aput v20, v0, v1

    const/16 v1, 0x210

    .line 230
    aput v22, v0, v1

    const/16 v1, 0x211

    const/16 v3, 0x2f

    aput v3, v0, v1

    const/16 v1, 0x212

    aput v9, v0, v1

    const/16 v1, 0x213

    aput v15, v0, v1

    const/16 v1, 0x214

    .line 231
    aput v22, v0, v1

    const/16 v1, 0x215

    const/16 v3, 0x3c

    aput v3, v0, v1

    const/16 v1, 0x216

    aput v10, v0, v1

    const/16 v1, 0x217

    aput v22, v0, v1

    const/16 v1, 0x218

    .line 232
    aput v22, v0, v1

    const/16 v1, 0x21a

    aput v10, v0, v1

    const/16 v1, 0x21b

    aput v18, v0, v1

    const/16 v1, 0x21c

    .line 233
    aput v22, v0, v1

    const/16 v1, 0x21d

    aput v12, v0, v1

    const/16 v1, 0x21e

    aput v11, v0, v1

    const/16 v1, 0x21f

    aput v13, v0, v1

    const/16 v1, 0x220

    .line 234
    aput v22, v0, v1

    const/16 v1, 0x221

    aput v14, v0, v1

    const/16 v1, 0x222

    const/16 v3, 0x12

    aput v3, v0, v1

    const/16 v1, 0x223

    aput v9, v0, v1

    const/16 v1, 0x224

    .line 235
    aput v22, v0, v1

    const/16 v1, 0x225

    aput v8, v0, v1

    const/16 v1, 0x226

    aput v3, v0, v1

    const/16 v1, 0x227

    aput v9, v0, v1

    const/16 v1, 0x228

    .line 236
    aput v22, v0, v1

    const/16 v1, 0x229

    aput v5, v0, v1

    const/16 v1, 0x22a

    aput v3, v0, v1

    const/16 v1, 0x22b

    aput v9, v0, v1

    const/16 v1, 0x22c

    .line 237
    aput v23, v0, v1

    const/16 v1, 0x22d

    const/16 v3, 0x2f

    aput v3, v0, v1

    const/16 v1, 0x22e

    aput v9, v0, v1

    const/16 v1, 0x22f

    const/16 v3, 0x16

    aput v3, v0, v1

    const/16 v1, 0x230

    .line 238
    aput v23, v0, v1

    const/16 v1, 0x231

    aput v6, v0, v1

    const/16 v1, 0x232

    aput v20, v0, v1

    const/16 v1, 0x233

    aput v9, v0, v1

    const/16 v1, 0x234

    .line 239
    aput v23, v0, v1

    const/16 v1, 0x236

    aput v10, v0, v1

    const/16 v1, 0x237

    aput v2, v0, v1

    const/16 v1, 0x238

    .line 240
    aput v23, v0, v1

    const/16 v1, 0x239

    aput v12, v0, v1

    const/16 v1, 0x23a

    aput v20, v0, v1

    const/16 v1, 0x23b

    aput v13, v0, v1

    const/16 v1, 0x23c

    .line 241
    aput v23, v0, v1

    const/16 v1, 0x23d

    aput v14, v0, v1

    const/16 v1, 0x23e

    aput v9, v0, v1

    const/16 v1, 0x23f

    aput v23, v0, v1

    const/16 v1, 0x240

    .line 242
    aput v23, v0, v1

    const/16 v1, 0x241

    aput v8, v0, v1

    const/16 v1, 0x242

    aput v9, v0, v1

    const/16 v1, 0x243

    aput v23, v0, v1

    const/16 v1, 0x244

    .line 243
    aput v23, v0, v1

    const/16 v1, 0x245

    aput v5, v0, v1

    const/16 v1, 0x246

    aput v9, v0, v1

    const/16 v1, 0x247

    aput v23, v0, v1

    const/16 v1, 0x248

    const/16 v2, 0x23

    .line 244
    aput v2, v0, v1

    const/16 v1, 0x24a

    const/16 v2, 0xd

    aput v2, v0, v1

    const/16 v1, 0x24b

    const/16 v2, 0x23

    aput v2, v0, v1

    const/16 v1, 0x24c

    .line 245
    aput v2, v0, v1

    const/16 v1, 0x24d

    aput v12, v0, v1

    const/16 v1, 0x24e

    const/16 v2, 0xd

    aput v2, v0, v1

    const/16 v1, 0x24f

    aput v13, v0, v1

    .line 97
    sput-object v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->statetable:[I

    .line 248
    const-string v45, "A_UNGET"

    const-string v46, "A_UNSAVE_PCDATA"

    const-string v14, ""

    const-string v15, "A_ADUP"

    const-string v16, "A_ADUP_SAVE"

    const-string v17, "A_ADUP_STAGC"

    const-string v18, "A_ANAME"

    const-string v19, "A_ANAME_ADUP"

    const-string v20, "A_ANAME_ADUP_STAGC"

    const-string v21, "A_AVAL"

    const-string v22, "A_AVAL_STAGC"

    const-string v23, "A_CDATA"

    const-string v24, "A_CMNT"

    const-string v25, "A_DECL"

    const-string v26, "A_EMPTYTAG"

    const-string v27, "A_ENTITY"

    const-string v28, "A_ENTITY_START"

    const-string v29, "A_ETAG"

    const-string v30, "A_GI"

    const-string v31, "A_GI_STAGC"

    const-string v32, "A_LT"

    const-string v33, "A_LT_PCDATA"

    const-string v34, "A_MINUS"

    const-string v35, "A_MINUS2"

    const-string v36, "A_MINUS3"

    const-string v37, "A_PCDATA"

    const-string v38, "A_PI"

    const-string v39, "A_PITARGET"

    const-string v40, "A_PITARGET_PI"

    const-string v41, "A_SAVE"

    const-string v42, "A_SKIP"

    const-string v43, "A_SP"

    const-string v44, "A_STAGC"

    filled-new-array/range {v14 .. v46}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->debug_actionnames:[Ljava/lang/String;

    .line 249
    const-string v35, "S_TAGWS"

    const-string v36, "S_XNCR"

    const-string v1, ""

    const-string v2, "S_ANAME"

    const-string v3, "S_APOS"

    const-string v4, "S_AVAL"

    const-string v5, "S_BB"

    const-string v6, "S_BBC"

    const-string v7, "S_BBCD"

    const-string v8, "S_BBCDA"

    const-string v9, "S_BBCDAT"

    const-string v10, "S_BBCDATA"

    const-string v11, "S_CDATA"

    const-string v12, "S_CDATA2"

    const-string v13, "S_CDSECT"

    const-string v14, "S_CDSECT1"

    const-string v15, "S_CDSECT2"

    const-string v16, "S_COM"

    const-string v17, "S_COM2"

    const-string v18, "S_COM3"

    const-string v19, "S_COM4"

    const-string v20, "S_DECL"

    const-string v21, "S_DECL2"

    const-string v22, "S_DONE"

    const-string v23, "S_EMPTYTAG"

    const-string v24, "S_ENT"

    const-string v25, "S_EQ"

    const-string v26, "S_ETAG"

    const-string v27, "S_GI"

    const-string v28, "S_NCR"

    const-string v29, "S_PCDATA"

    const-string v30, "S_PI"

    const-string v31, "S_PITARGET"

    const-string v32, "S_QUOT"

    const-string v33, "S_STAGC"

    const-string v34, "S_TAG"

    filled-new-array/range {v1 .. v36}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->debug_statenames:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc8

    .line 263
    new-array v0, v0, [C

    iput-object v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    const/16 v0, 0x20

    .line 269
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theWinMap:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x20ac
        0xfffd
        0x201a
        0x192
        0x201e
        0x2026
        0x2020
        0x2021
        0x2c6
        0x2030
        0x160
        0x2039
        0x152
        0xfffd
        0x17d
        0xfffd
        0xfffd
        0x2018
        0x2019
        0x201c
        0x201d
        0x2022
        0x2013
        0x2014
        0x2dc
        0x2122
        0x161
        0x203a
        0x153
        0xfffd
        0x17e
        0x178
    .end array-data
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 633
    new-instance p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;

    invoke-direct {p0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;-><init>()V

    .line 634
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    const-string v2, "UTF-8"

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 635
    new-instance v1, Ljava/io/OutputStreamWriter;

    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v1, v3, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 636
    new-instance v2, Lorg/ccil/cowan/tagsoup/PYXWriter;

    invoke-direct {v2, v1}, Lorg/ccil/cowan/tagsoup/PYXWriter;-><init>(Ljava/io/Writer;)V

    .line 637
    invoke-interface {p0, v0, v2}, Lorg/ccil/cowan/tagsoup/Scanner;->scan(Ljava/io/Reader;Lorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 638
    invoke-virtual {v1}, Ljava/io/Writer;->close()V

    return-void
.end method

.method private mark()V
    .locals 1

    .line 598
    iget v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    iput v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theLastColumn:I

    .line 599
    iget v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentLine:I

    iput v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theLastLine:I

    return-void
.end method

.method private static nicechar(I)Ljava/lang/String;
    .locals 2

    const/16 v0, 0xa

    if-ne p0, v0, :cond_0

    .line 643
    const-string p0, "\\n"

    return-object p0

    :cond_0
    const/16 v0, 0x20

    if-ge p0, v0, :cond_1

    .line 644
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0x"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 645
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char p0, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 611
    iget v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    iget-object v1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    array-length v2, v1

    add-int/lit8 v2, v2, -0x14

    if-lt v0, v2, :cond_2

    .line 612
    iget v2, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    const/16 v3, 0x1c

    const/4 v4, 0x0

    if-eq v2, v3, :cond_1

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    goto :goto_0

    .line 619
    :cond_0
    array-length p2, v1

    mul-int/lit8 p2, p2, 0x2

    new-array p2, p2, [C

    add-int/lit8 v0, v0, 0x1

    .line 620
    invoke-static {v1, v4, p2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 621
    iput-object p2, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    goto :goto_1

    .line 614
    :cond_1
    :goto_0
    invoke-interface {p2, v1, v4, v0}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pcdata([CII)V

    .line 615
    iput v4, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 624
    :cond_2
    :goto_1
    iget-object p2, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    int-to-char p1, p1

    aput-char p1, p2, v0

    return-void
.end method

.method private unread(Ljava/io/PushbackReader;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 274
    invoke-virtual {p1, p2}, Ljava/io/PushbackReader;->unread(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getColumnNumber()I
    .locals 1

    .line 283
    iget v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theLastColumn:I

    return v0
.end method

.method public getLineNumber()I
    .locals 1

    .line 280
    iget v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theLastLine:I

    return v0
.end method

.method public getPublicId()Ljava/lang/String;
    .locals 1

    .line 286
    iget-object v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->thePublicid:Ljava/lang/String;

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .locals 1

    .line 289
    iget-object v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSystemid:Ljava/lang/String;

    return-object v0
.end method

.method public resetDocumentLocator(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 302
    iput-object p1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->thePublicid:Ljava/lang/String;

    .line 303
    iput-object p2, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSystemid:Ljava/lang/String;

    const/4 p1, 0x0

    .line 304
    iput p1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    iput p1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentLine:I

    iput p1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theLastColumn:I

    iput p1, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theLastLine:I

    return-void
.end method

.method public scan(Ljava/io/Reader;Lorg/ccil/cowan/tagsoup/ScanHandler;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/16 v3, 0x1c

    .line 314
    iput v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    .line 316
    instance-of v4, v1, Ljava/io/PushbackReader;

    if-eqz v4, :cond_0

    .line 317
    check-cast v1, Ljava/io/PushbackReader;

    goto :goto_1

    .line 319
    :cond_0
    instance-of v4, v1, Ljava/io/BufferedReader;

    if-eqz v4, :cond_1

    .line 320
    new-instance v4, Ljava/io/PushbackReader;

    invoke-direct {v4, v1}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0

    .line 323
    :cond_1
    new-instance v4, Ljava/io/PushbackReader;

    new-instance v5, Ljava/io/BufferedReader;

    const/16 v6, 0xc8

    invoke-direct {v5, v1, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    invoke-direct {v4, v5}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;)V

    :goto_0
    move-object v1, v4

    .line 326
    :goto_1
    invoke-virtual {v1}, Ljava/io/PushbackReader;->read()I

    move-result v4

    const v5, 0xfeff

    if-eq v4, v5, :cond_2

    .line 327
    invoke-direct {v0, v1, v4}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->unread(Ljava/io/PushbackReader;I)V

    .line 329
    :cond_2
    :goto_2
    iget v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    const/16 v5, 0x15

    const/4 v6, 0x0

    if-ne v4, v5, :cond_3

    .line 589
    iget-object v1, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v1, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->eof([CII)V

    return-void

    .line 330
    :cond_3
    invoke-virtual {v1}, Ljava/io/PushbackReader;->read()I

    move-result v4

    const/16 v5, 0x9f

    const/16 v7, 0x80

    if-lt v4, v7, :cond_4

    if-gt v4, v5, :cond_4

    .line 333
    iget-object v8, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theWinMap:[I

    add-int/lit8 v4, v4, -0x80

    aget v4, v8, v4

    :cond_4
    const/16 v8, 0xd

    const/16 v9, 0xa

    if-ne v4, v8, :cond_5

    .line 336
    invoke-virtual {v1}, Ljava/io/PushbackReader;->read()I

    move-result v4

    if-eq v4, v9, :cond_5

    .line 338
    invoke-direct {v0, v1, v4}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->unread(Ljava/io/PushbackReader;I)V

    const/16 v4, 0xa

    :cond_5
    const/4 v8, 0x1

    if-ne v4, v9, :cond_6

    .line 344
    iget v10, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentLine:I

    add-int/2addr v10, v8

    iput v10, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentLine:I

    .line 345
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    goto :goto_3

    .line 348
    :cond_6
    iget v10, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    add-int/2addr v10, v8

    iput v10, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    :goto_3
    const/4 v10, -0x1

    const/16 v11, 0x20

    if-ge v4, v11, :cond_7

    if-eq v4, v9, :cond_7

    const/16 v9, 0x9

    if-eq v4, v9, :cond_7

    if-eq v4, v10, :cond_7

    goto :goto_2

    :cond_7
    const/4 v9, 0x0

    const/4 v12, 0x0

    .line 355
    :goto_4
    sget-object v13, Lorg/ccil/cowan/tagsoup/HTMLScanner;->statetable:[I

    array-length v14, v13

    if-lt v9, v14, :cond_8

    goto :goto_5

    .line 356
    :cond_8
    iget v14, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    aget v15, v13, v9

    if-eq v14, v15, :cond_9

    if-eqz v12, :cond_1b

    goto :goto_5

    :cond_9
    add-int/lit8 v14, v9, 0x1

    .line 360
    aget v14, v13, v14

    if-nez v14, :cond_a

    add-int/lit8 v12, v9, 0x2

    .line 361
    aget v12, v13, v12

    add-int/lit8 v14, v9, 0x3

    .line 362
    aget v13, v13, v14

    iput v13, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    goto/16 :goto_a

    :cond_a
    if-ne v14, v4, :cond_1b

    add-int/lit8 v12, v9, 0x2

    .line 365
    aget v12, v13, v12

    add-int/lit8 v9, v9, 0x3

    .line 366
    aget v9, v13, v9

    iput v9, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    :goto_5
    const/16 v9, 0x3c

    const/16 v13, 0x2d

    packed-switch v12, :pswitch_data_0

    .line 585
    new-instance v1, Ljava/lang/Error;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Can\'t process state "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v1

    .line 580
    :pswitch_0
    iget v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    if-lez v4, :cond_b

    add-int/lit8 v4, v4, -0x1

    iput v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 581
    :cond_b
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pcdata([CII)V

    .line 582
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 576
    :pswitch_1
    invoke-direct {v0, v1, v4}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->unread(Ljava/io/PushbackReader;I)V

    .line 577
    iget v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    sub-int/2addr v4, v8

    iput v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    goto/16 :goto_9

    .line 565
    :pswitch_2
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->stagc([CII)V

    .line 566
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 562
    :pswitch_3
    invoke-direct {v0, v11, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    .line 557
    :pswitch_4
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    .line 552
    :pswitch_5
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pitarget([CII)V

    .line 553
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 554
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pi([CII)V

    goto/16 :goto_9

    .line 548
    :pswitch_6
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pitarget([CII)V

    .line 549
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 543
    :pswitch_7
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 544
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pi([CII)V

    .line 545
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 521
    :pswitch_8
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 522
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pcdata([CII)V

    .line 523
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 531
    :pswitch_9
    invoke-direct {v0, v13, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 532
    invoke-direct {v0, v11, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    .line 535
    :pswitch_a
    invoke-direct {v0, v13, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 536
    invoke-direct {v0, v11, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 539
    :pswitch_b
    invoke-direct {v0, v13, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 540
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    .line 515
    :pswitch_c
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 516
    invoke-direct {v0, v9, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 517
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pcdata([CII)V

    .line 518
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 510
    :pswitch_d
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 511
    invoke-direct {v0, v9, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    .line 512
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    .line 505
    :pswitch_e
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->gi([CII)V

    .line 506
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 507
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->stagc([CII)V

    goto/16 :goto_9

    .line 501
    :pswitch_f
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->gi([CII)V

    .line 502
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 493
    :pswitch_10
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->etag([CII)V

    .line 494
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 422
    :pswitch_11
    iget-object v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v7, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v5, v6, v7}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pcdata([CII)V

    .line 423
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 424
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    .line 427
    :pswitch_12
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    int-to-char v9, v4

    .line 430
    iget v12, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    const/16 v13, 0x17

    const/16 v14, 0x23

    const/16 v15, 0x1b

    if-ne v12, v13, :cond_c

    if-ne v9, v14, :cond_c

    .line 431
    iput v15, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    .line 432
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto/16 :goto_9

    :cond_c
    if-ne v12, v15, :cond_e

    const/16 v3, 0x78

    if-eq v9, v3, :cond_d

    const/16 v3, 0x58

    if-ne v9, v3, :cond_e

    .line 436
    :cond_d
    iput v14, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    .line 437
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    :goto_6
    const/16 v3, 0x1c

    goto/16 :goto_9

    :cond_e
    if-ne v12, v13, :cond_f

    .line 440
    invoke-static {v9}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 441
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto :goto_6

    .line 444
    :cond_f
    iget v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    if-ne v3, v15, :cond_10

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 445
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto :goto_6

    .line 448
    :cond_10
    iget v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    if-ne v3, v14, :cond_12

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_11

    const-string v3, "abcdefABCDEF"

    invoke-virtual {v3, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eq v3, v10, :cond_12

    .line 449
    :cond_11
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto :goto_6

    .line 455
    :cond_12
    iget-object v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v9, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    sub-int/2addr v9, v8

    invoke-interface {v2, v3, v8, v9}, Lorg/ccil/cowan/tagsoup/ScanHandler;->entity([CII)V

    .line 456
    invoke-interface {v2}, Lorg/ccil/cowan/tagsoup/ScanHandler;->getEntity()I

    move-result v3

    if-eqz v3, :cond_17

    .line 459
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    if-lt v3, v7, :cond_13

    if-gt v3, v5, :cond_13

    .line 461
    iget-object v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theWinMap:[I

    add-int/lit8 v3, v3, -0x80

    aget v3, v5, v3

    :cond_13
    if-ge v3, v11, :cond_14

    goto :goto_7

    :cond_14
    const v5, 0xd800

    if-lt v3, v5, :cond_15

    const v6, 0xdfff

    if-gt v3, v6, :cond_15

    goto :goto_7

    :cond_15
    const v6, 0xffff

    if-gt v3, v6, :cond_16

    .line 473
    invoke-direct {v0, v3, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto :goto_7

    :cond_16
    const/high16 v6, 0x10000

    sub-int/2addr v3, v6

    shr-int/lit8 v6, v3, 0xa

    add-int/2addr v6, v5

    .line 478
    invoke-direct {v0, v6, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    and-int/lit16 v3, v3, 0x3ff

    const v5, 0xdc00

    add-int/2addr v3, v5

    .line 479
    invoke-direct {v0, v3, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    :goto_7
    const/16 v3, 0x3b

    if-eq v4, v3, :cond_18

    .line 482
    invoke-direct {v0, v1, v4}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->unread(Ljava/io/PushbackReader;I)V

    .line 483
    iget v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    sub-int/2addr v3, v8

    iput v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    goto :goto_8

    .line 487
    :cond_17
    invoke-direct {v0, v1, v4}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->unread(Ljava/io/PushbackReader;I)V

    .line 488
    iget v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    sub-int/2addr v3, v8

    iput v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theCurrentColumn:I

    :cond_18
    :goto_8
    const/16 v3, 0x1c

    .line 490
    iput v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    goto/16 :goto_9

    .line 569
    :pswitch_13
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 571
    iget v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    if-lez v4, :cond_19

    iget-object v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v5, v6, v4}, Lorg/ccil/cowan/tagsoup/ScanHandler;->gi([CII)V

    .line 572
    :cond_19
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 573
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->stage([CII)V

    goto/16 :goto_9

    .line 497
    :pswitch_14
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->decl([CII)V

    .line 498
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 526
    :pswitch_15
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 527
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->cmnt([CII)V

    .line 528
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto/16 :goto_9

    .line 415
    :pswitch_16
    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->mark()V

    .line 417
    iget v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    if-le v4, v8, :cond_1a

    add-int/lit8 v4, v4, -0x2

    iput v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 418
    :cond_1a
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->pcdata([CII)V

    .line 419
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto :goto_9

    .line 410
    :pswitch_17
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->aval([CII)V

    .line 411
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 412
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->stagc([CII)V

    goto :goto_9

    .line 406
    :pswitch_18
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->aval([CII)V

    .line 407
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto :goto_9

    .line 400
    :pswitch_19
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->aname([CII)V

    .line 401
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 402
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->adup([CII)V

    .line 403
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->stagc([CII)V

    goto :goto_9

    .line 395
    :pswitch_1a
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->aname([CII)V

    .line 396
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 397
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->adup([CII)V

    goto :goto_9

    .line 391
    :pswitch_1b
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->aname([CII)V

    .line 392
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    goto :goto_9

    .line 386
    :pswitch_1c
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->adup([CII)V

    .line 387
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 388
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    invoke-interface {v2, v4, v6, v6}, Lorg/ccil/cowan/tagsoup/ScanHandler;->stagc([CII)V

    goto :goto_9

    .line 381
    :pswitch_1d
    iget-object v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v7, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v5, v6, v7}, Lorg/ccil/cowan/tagsoup/ScanHandler;->adup([CII)V

    .line 382
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 383
    invoke-direct {v0, v4, v2}, Lorg/ccil/cowan/tagsoup/HTMLScanner;->save(ILorg/ccil/cowan/tagsoup/ScanHandler;)V

    goto :goto_9

    .line 377
    :pswitch_1e
    iget-object v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theOutputBuffer:[C

    iget v5, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    invoke-interface {v2, v4, v6, v5}, Lorg/ccil/cowan/tagsoup/ScanHandler;->adup([CII)V

    .line 378
    iput v6, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theSize:I

    .line 587
    :goto_9
    :pswitch_1f
    iget v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    iput v4, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    goto/16 :goto_2

    .line 373
    :pswitch_20
    new-instance v1, Ljava/lang/Error;

    .line 374
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "HTMLScanner can\'t cope with "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " in state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    iget v3, v0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theState:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 373
    invoke-direct {v1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1b
    :goto_a
    add-int/lit8 v9, v9, 0x4

    goto/16 :goto_4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_20
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_1f
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public startCDATA()V
    .locals 1

    const/16 v0, 0xa

    .line 608
    iput v0, p0, Lorg/ccil/cowan/tagsoup/HTMLScanner;->theNextState:I

    return-void
.end method
