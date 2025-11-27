.class public final enum Lorg/apache/commons/vfs2/util/RandomAccessMode;
.super Ljava/lang/Enum;
.source "RandomAccessMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/util/RandomAccessMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/util/RandomAccessMode;

.field public static final enum READ:Lorg/apache/commons/vfs2/util/RandomAccessMode;

.field public static final enum READWRITE:Lorg/apache/commons/vfs2/util/RandomAccessMode;


# instance fields
.field private final read:Z

.field private final write:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;

    const-string v1, "READ"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3, v2}, Lorg/apache/commons/vfs2/util/RandomAccessMode;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->READ:Lorg/apache/commons/vfs2/util/RandomAccessMode;

    .line 31
    new-instance v1, Lorg/apache/commons/vfs2/util/RandomAccessMode;

    const-string v4, "READWRITE"

    invoke-direct {v1, v4, v3, v3, v3}, Lorg/apache/commons/vfs2/util/RandomAccessMode;-><init>(Ljava/lang/String;IZZ)V

    sput-object v1, Lorg/apache/commons/vfs2/util/RandomAccessMode;->READWRITE:Lorg/apache/commons/vfs2/util/RandomAccessMode;

    const/4 v4, 0x2

    .line 22
    new-array v4, v4, [Lorg/apache/commons/vfs2/util/RandomAccessMode;

    aput-object v0, v4, v2

    aput-object v1, v4, v3

    sput-object v4, Lorg/apache/commons/vfs2/util/RandomAccessMode;->$VALUES:[Lorg/apache/commons/vfs2/util/RandomAccessMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 37
    iput-boolean p3, p0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->read:Z

    .line 38
    iput-boolean p4, p0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->write:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/util/RandomAccessMode;
    .locals 1

    .line 22
    const-class v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/util/RandomAccessMode;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/util/RandomAccessMode;
    .locals 1

    .line 22
    sget-object v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->$VALUES:[Lorg/apache/commons/vfs2/util/RandomAccessMode;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/util/RandomAccessMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/util/RandomAccessMode;

    return-object v0
.end method


# virtual methods
.method public getModeString()Ljava/lang/String;
    .locals 1

    .line 54
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/RandomAccessMode;->requestRead()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 55
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/RandomAccessMode;->requestWrite()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    const-string v0, "rw"

    return-object v0

    .line 58
    :cond_0
    const-string v0, "r"

    return-object v0

    .line 59
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/RandomAccessMode;->requestWrite()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 60
    const-string v0, "w"

    return-object v0

    .line 63
    :cond_2
    const-string v0, ""

    return-object v0
.end method

.method public requestRead()Z
    .locals 1

    .line 42
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->read:Z

    return v0
.end method

.method public requestWrite()Z
    .locals 1

    .line 46
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->write:Z

    return v0
.end method
