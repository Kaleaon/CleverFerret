.class public Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;
.super Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;
.source "GenericFileNameParser.java"


# static fields
.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;
    .locals 1

    .line 35
    sget-object v0, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    return-object v0
.end method


# virtual methods
.method protected createFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 61
    new-instance p2, Lorg/apache/commons/vfs2/provider/local/LocalFileName;

    const-string v0, ""

    invoke-direct {p2, p1, v0, p3, p4}, Lorg/apache/commons/vfs2/provider/local/LocalFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object p2
.end method

.method protected extractRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 46
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p2

    const/16 v0, 0x2f

    if-ne p2, v0, :cond_0

    .line 51
    const-string p1, "/"

    return-object p1

    .line 47
    :cond_0
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider.local/not-absolute-file-name.error"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method
