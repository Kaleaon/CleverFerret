.class public final enum Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;
.super Ljava/lang/Enum;
.source "FtpsDataChannelProtectionLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

.field public static final enum C:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

.field public static final enum E:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

.field public static final enum P:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

.field public static final enum S:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    const-string v1, "C"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->C:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    new-instance v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    const-string v3, "S"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->S:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    new-instance v3, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    const-string v5, "E"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->E:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    new-instance v5, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    const-string v7, "P"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->P:Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    const/4 v7, 0x4

    .line 25
    new-array v7, v7, [Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->$VALUES:[Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;
    .locals 1

    .line 25
    const-class v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;
    .locals 1

    .line 25
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->$VALUES:[Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    return-object v0
.end method
