.class public final enum Lcom/github/junrar/rarfile/SubBlockHeaderType;
.super Ljava/lang/Enum;
.source "SubBlockHeaderType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/rarfile/SubBlockHeaderType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/rarfile/SubBlockHeaderType;

.field public static final enum BEEA_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

.field public static final enum EA_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

.field public static final enum MAC_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

.field public static final enum NTACL_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

.field public static final enum STREAM_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

.field public static final enum UO_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;


# instance fields
.field private subblocktype:S


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 23
    new-instance v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/16 v1, 0x100

    const-string v2, "EA_HEAD"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/github/junrar/rarfile/SubBlockHeaderType;-><init>(Ljava/lang/String;IS)V

    sput-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->EA_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    .line 24
    new-instance v1, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/16 v2, 0x101

    const-string v4, "UO_HEAD"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/github/junrar/rarfile/SubBlockHeaderType;-><init>(Ljava/lang/String;IS)V

    sput-object v1, Lcom/github/junrar/rarfile/SubBlockHeaderType;->UO_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    .line 25
    new-instance v2, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/16 v4, 0x102

    const-string v6, "MAC_HEAD"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lcom/github/junrar/rarfile/SubBlockHeaderType;-><init>(Ljava/lang/String;IS)V

    sput-object v2, Lcom/github/junrar/rarfile/SubBlockHeaderType;->MAC_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    .line 26
    new-instance v4, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/16 v6, 0x103

    const-string v8, "BEEA_HEAD"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lcom/github/junrar/rarfile/SubBlockHeaderType;-><init>(Ljava/lang/String;IS)V

    sput-object v4, Lcom/github/junrar/rarfile/SubBlockHeaderType;->BEEA_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    .line 27
    new-instance v6, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/16 v8, 0x104

    const-string v10, "NTACL_HEAD"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v8}, Lcom/github/junrar/rarfile/SubBlockHeaderType;-><init>(Ljava/lang/String;IS)V

    sput-object v6, Lcom/github/junrar/rarfile/SubBlockHeaderType;->NTACL_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    .line 28
    new-instance v8, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/16 v10, 0x105

    const-string v12, "STREAM_HEAD"

    const/4 v13, 0x5

    invoke-direct {v8, v12, v13, v10}, Lcom/github/junrar/rarfile/SubBlockHeaderType;-><init>(Ljava/lang/String;IS)V

    sput-object v8, Lcom/github/junrar/rarfile/SubBlockHeaderType;->STREAM_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    const/4 v10, 0x6

    .line 22
    new-array v10, v10, [Lcom/github/junrar/rarfile/SubBlockHeaderType;

    aput-object v0, v10, v3

    aput-object v1, v10, v5

    aput-object v2, v10, v7

    aput-object v4, v10, v9

    aput-object v6, v10, v11

    aput-object v8, v10, v13

    sput-object v10, Lcom/github/junrar/rarfile/SubBlockHeaderType;->$VALUES:[Lcom/github/junrar/rarfile/SubBlockHeaderType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IS)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(S)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 33
    iput-short p3, p0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->subblocktype:S

    return-void
.end method

.method public static findSubblockHeaderType(S)Lcom/github/junrar/rarfile/SubBlockHeaderType;
    .locals 2

    .line 51
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->EA_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->equals(S)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 53
    :cond_0
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->UO_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->equals(S)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 55
    :cond_1
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->MAC_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->equals(S)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    .line 57
    :cond_2
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->BEEA_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->equals(S)Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v0

    .line 59
    :cond_3
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->NTACL_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->equals(S)Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v0

    .line 61
    :cond_4
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->STREAM_HEAD:Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->equals(S)Z

    move-result p0

    if-eqz p0, :cond_5

    return-object v0

    :cond_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/rarfile/SubBlockHeaderType;
    .locals 1

    .line 22
    const-class v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/rarfile/SubBlockHeaderType;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/rarfile/SubBlockHeaderType;
    .locals 1

    .line 22
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->$VALUES:[Lcom/github/junrar/rarfile/SubBlockHeaderType;

    invoke-virtual {v0}, [Lcom/github/junrar/rarfile/SubBlockHeaderType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/rarfile/SubBlockHeaderType;

    return-object v0
.end method


# virtual methods
.method public equals(S)Z
    .locals 1

    .line 42
    iget-short v0, p0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->subblocktype:S

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getSubblocktype()S
    .locals 1

    .line 71
    iget-short v0, p0, Lcom/github/junrar/rarfile/SubBlockHeaderType;->subblocktype:S

    return v0
.end method
