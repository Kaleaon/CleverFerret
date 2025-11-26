.class public final enum Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;
.super Ljava/lang/Enum;
.source "FtpFileType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

.field public static final enum ASCII:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

.field public static final enum BINARY:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

.field public static final enum EBCDIC:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

.field public static final enum LOCAL:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 30
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    const-string v1, "ASCII"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->ASCII:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    .line 35
    new-instance v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    const-string v3, "BINARY"

    const/4 v4, 0x1

    const/4 v5, 0x2

    invoke-direct {v1, v3, v4, v5}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->BINARY:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    .line 40
    new-instance v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    const-string v6, "LOCAL"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v5, v7}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->LOCAL:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    .line 45
    new-instance v6, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    const-string v8, "EBCDIC"

    invoke-direct {v6, v8, v7, v4}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->EBCDIC:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    const/4 v8, 0x4

    .line 26
    new-array v8, v8, [Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    aput-object v0, v8, v2

    aput-object v1, v8, v4

    aput-object v3, v8, v5

    aput-object v6, v8, v7

    sput-object v8, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->$VALUES:[Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 58
    iput p3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;
    .locals 1

    .line 26
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;
    .locals 1

    .line 26
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->$VALUES:[Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    return-object v0
.end method


# virtual methods
.method getValue()I
    .locals 1

    .line 67
    iget v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->value:I

    return v0
.end method
