.class public final Lorg/apache/commons/vfs2/util/OsFamily;
.super Ljava/lang/Object;
.source "OsFamily.java"


# instance fields
.field private final families:[Lorg/apache/commons/vfs2/util/OsFamily;

.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/OsFamily;->name:Ljava/lang/String;

    const/4 p1, 0x0

    .line 28
    new-array p1, p1, [Lorg/apache/commons/vfs2/util/OsFamily;

    iput-object p1, p0, Lorg/apache/commons/vfs2/util/OsFamily;->families:[Lorg/apache/commons/vfs2/util/OsFamily;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;[Lorg/apache/commons/vfs2/util/OsFamily;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/OsFamily;->name:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lorg/apache/commons/vfs2/util/OsFamily;->families:[Lorg/apache/commons/vfs2/util/OsFamily;

    return-void
.end method


# virtual methods
.method public getFamilies()[Lorg/apache/commons/vfs2/util/OsFamily;
    .locals 1

    .line 51
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/OsFamily;->families:[Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/OsFamily;->name:Ljava/lang/String;

    return-object v0
.end method
