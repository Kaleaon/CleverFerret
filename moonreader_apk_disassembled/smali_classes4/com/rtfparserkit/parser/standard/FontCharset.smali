.class Lcom/rtfparserkit/parser/standard/FontCharset;
.super Ljava/lang/Object;
.source "FontCharset.java"


# static fields
.field private static final MAPPING:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0x100

    .line 37
    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/rtfparserkit/parser/standard/FontCharset;->MAPPING:[Ljava/lang/String;

    const/4 v1, 0x0

    .line 40
    const-string v2, "1252"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 41
    aput-object v3, v0, v1

    const/4 v1, 0x2

    .line 42
    aput-object v2, v0, v1

    const/16 v1, 0x4d

    .line 43
    const-string v2, "10000"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    .line 44
    const-string v2, "10001"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    .line 45
    const-string v2, "10003"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    .line 46
    const-string v2, "10008"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    .line 47
    const-string v2, "10002"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    .line 48
    aput-object v3, v0, v1

    const/16 v1, 0x53

    .line 49
    const-string v2, "10005"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    .line 50
    const-string v2, "10004"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    .line 51
    const-string v2, "10006"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    .line 52
    const-string v2, "10081"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    .line 53
    const-string v2, "10021"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    .line 54
    const-string v2, "10029"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    .line 55
    const-string v2, "10007"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    .line 56
    const-string v2, "932"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    .line 57
    const-string v2, "949"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    .line 58
    const-string v2, "1361"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    .line 59
    const-string v2, "936"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    .line 60
    const-string v2, "950"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    .line 61
    const-string v2, "1253"

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    .line 62
    const-string v2, "1254"

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    .line 63
    const-string v2, "1258"

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    .line 64
    const-string v2, "1255"

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    .line 65
    const-string v2, "1256"

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    .line 66
    aput-object v3, v0, v1

    const/16 v1, 0xb4

    .line 67
    aput-object v3, v0, v1

    const/16 v1, 0xb5

    .line 68
    aput-object v3, v0, v1

    const/16 v1, 0xba

    .line 69
    const-string v2, "1257"

    aput-object v2, v0, v1

    const/16 v1, 0xcc

    .line 70
    const-string v2, "1251"

    aput-object v2, v0, v1

    const/16 v1, 0xde

    .line 71
    const-string v2, "874"

    aput-object v2, v0, v1

    const/16 v1, 0xee

    .line 72
    const-string v2, "1250"

    aput-object v2, v0, v1

    const/16 v1, 0xfe

    .line 73
    const-string v2, "437"

    aput-object v2, v0, v1

    const/16 v1, 0xff

    .line 74
    const-string v2, "850"

    aput-object v2, v0, v1

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCharset(I)Ljava/lang/String;
    .locals 2

    if-ltz p0, :cond_0

    .line 30
    sget-object v0, Lcom/rtfparserkit/parser/standard/FontCharset;->MAPPING:[Ljava/lang/String;

    array-length v1, v0

    if-ge p0, v1, :cond_0

    .line 32
    aget-object p0, v0, p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method
