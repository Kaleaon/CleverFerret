.class public final enum Lcom/github/junrar/rarfile/HostSystem;
.super Ljava/lang/Enum;
.source "HostSystem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/rarfile/HostSystem;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/rarfile/HostSystem;

.field public static final enum beos:Lcom/github/junrar/rarfile/HostSystem;

.field public static final enum macos:Lcom/github/junrar/rarfile/HostSystem;

.field public static final enum msdos:Lcom/github/junrar/rarfile/HostSystem;

.field public static final enum os2:Lcom/github/junrar/rarfile/HostSystem;

.field public static final enum unix:Lcom/github/junrar/rarfile/HostSystem;

.field public static final enum win32:Lcom/github/junrar/rarfile/HostSystem;


# instance fields
.field private hostByte:B


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 28
    new-instance v0, Lcom/github/junrar/rarfile/HostSystem;

    const-string v1, "msdos"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/github/junrar/rarfile/HostSystem;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/github/junrar/rarfile/HostSystem;->msdos:Lcom/github/junrar/rarfile/HostSystem;

    .line 29
    new-instance v1, Lcom/github/junrar/rarfile/HostSystem;

    const-string v3, "os2"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/github/junrar/rarfile/HostSystem;-><init>(Ljava/lang/String;IB)V

    sput-object v1, Lcom/github/junrar/rarfile/HostSystem;->os2:Lcom/github/junrar/rarfile/HostSystem;

    .line 30
    new-instance v3, Lcom/github/junrar/rarfile/HostSystem;

    const-string v5, "win32"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/github/junrar/rarfile/HostSystem;-><init>(Ljava/lang/String;IB)V

    sput-object v3, Lcom/github/junrar/rarfile/HostSystem;->win32:Lcom/github/junrar/rarfile/HostSystem;

    .line 31
    new-instance v5, Lcom/github/junrar/rarfile/HostSystem;

    const-string v7, "unix"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/github/junrar/rarfile/HostSystem;-><init>(Ljava/lang/String;IB)V

    sput-object v5, Lcom/github/junrar/rarfile/HostSystem;->unix:Lcom/github/junrar/rarfile/HostSystem;

    .line 32
    new-instance v7, Lcom/github/junrar/rarfile/HostSystem;

    const-string v9, "macos"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/github/junrar/rarfile/HostSystem;-><init>(Ljava/lang/String;IB)V

    sput-object v7, Lcom/github/junrar/rarfile/HostSystem;->macos:Lcom/github/junrar/rarfile/HostSystem;

    .line 33
    new-instance v9, Lcom/github/junrar/rarfile/HostSystem;

    const-string v11, "beos"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v12}, Lcom/github/junrar/rarfile/HostSystem;-><init>(Ljava/lang/String;IB)V

    sput-object v9, Lcom/github/junrar/rarfile/HostSystem;->beos:Lcom/github/junrar/rarfile/HostSystem;

    const/4 v11, 0x6

    .line 27
    new-array v11, v11, [Lcom/github/junrar/rarfile/HostSystem;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lcom/github/junrar/rarfile/HostSystem;->$VALUES:[Lcom/github/junrar/rarfile/HostSystem;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IB)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)V"
        }
    .end annotation

    .line 60
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 61
    iput-byte p3, p0, Lcom/github/junrar/rarfile/HostSystem;->hostByte:B

    return-void
.end method

.method public static findHostSystem(B)Lcom/github/junrar/rarfile/HostSystem;
    .locals 2

    .line 38
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->msdos:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/HostSystem;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 41
    :cond_0
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->os2:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/HostSystem;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 44
    :cond_1
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->win32:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/HostSystem;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    .line 47
    :cond_2
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->unix:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/HostSystem;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v0

    .line 50
    :cond_3
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->macos:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/HostSystem;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v0

    .line 53
    :cond_4
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->beos:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/HostSystem;->equals(B)Z

    move-result p0

    if-eqz p0, :cond_5

    return-object v0

    :cond_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/rarfile/HostSystem;
    .locals 1

    .line 27
    const-class v0, Lcom/github/junrar/rarfile/HostSystem;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/rarfile/HostSystem;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/rarfile/HostSystem;
    .locals 1

    .line 27
    sget-object v0, Lcom/github/junrar/rarfile/HostSystem;->$VALUES:[Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v0}, [Lcom/github/junrar/rarfile/HostSystem;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/rarfile/HostSystem;

    return-object v0
.end method


# virtual methods
.method public equals(B)Z
    .locals 1

    .line 65
    iget-byte v0, p0, Lcom/github/junrar/rarfile/HostSystem;->hostByte:B

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getHostByte()B
    .locals 1

    .line 69
    iget-byte v0, p0, Lcom/github/junrar/rarfile/HostSystem;->hostByte:B

    return v0
.end method
