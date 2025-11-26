.class public final enum Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;
.super Ljava/lang/Enum;
.source "FtpsMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

.field public static final enum EXPLICIT:Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

.field public static final enum IMPLICIT:Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 32
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    const-string v1, "IMPLICIT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->IMPLICIT:Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    new-instance v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    const-string v3, "EXPLICIT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->EXPLICIT:Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    const/4 v3, 0x2

    .line 31
    new-array v3, v3, [Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->$VALUES:[Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;
    .locals 1

    .line 31
    const-class v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;
    .locals 1

    .line 31
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->$VALUES:[Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    return-object v0
.end method
