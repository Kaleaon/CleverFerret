.class public final enum Lcom/github/junrar/unpack/vm/VMStandardFilters;
.super Ljava/lang/Enum;
.source "VMStandardFilters.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/unpack/vm/VMStandardFilters;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_AUDIO:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_DELTA:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_E8:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_E8E9:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_ITANIUM:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_NONE:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_RGB:Lcom/github/junrar/unpack/vm/VMStandardFilters;

.field public static final enum VMSF_UPCASE:Lcom/github/junrar/unpack/vm/VMStandardFilters;


# instance fields
.field private filter:I


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 27
    new-instance v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v1, "VMSF_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_NONE:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 28
    new-instance v1, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v3, "VMSF_E8"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_E8:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 29
    new-instance v3, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v5, "VMSF_E8E9"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_E8E9:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 30
    new-instance v5, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v7, "VMSF_ITANIUM"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_ITANIUM:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 31
    new-instance v7, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v9, "VMSF_RGB"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_RGB:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 32
    new-instance v9, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v11, "VMSF_AUDIO"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v12}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_AUDIO:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 33
    new-instance v11, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v13, "VMSF_DELTA"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v14}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_DELTA:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    .line 34
    new-instance v13, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const-string v15, "VMSF_UPCASE"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2, v2}, Lcom/github/junrar/unpack/vm/VMStandardFilters;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_UPCASE:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    const/16 v15, 0x8

    .line 26
    new-array v15, v15, [Lcom/github/junrar/unpack/vm/VMStandardFilters;

    aput-object v0, v15, v16

    aput-object v1, v15, v4

    aput-object v3, v15, v6

    aput-object v5, v15, v8

    aput-object v7, v15, v10

    aput-object v9, v15, v12

    aput-object v11, v15, v14

    aput-object v13, v15, v2

    sput-object v15, Lcom/github/junrar/unpack/vm/VMStandardFilters;->$VALUES:[Lcom/github/junrar/unpack/vm/VMStandardFilters;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 39
    iput p3, p0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->filter:I

    return-void
.end method

.method public static findFilter(I)Lcom/github/junrar/unpack/vm/VMStandardFilters;
    .locals 2

    .line 51
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_NONE:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 55
    :cond_0
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_E8:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 59
    :cond_1
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_E8E9:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    .line 62
    :cond_2
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_ITANIUM:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v0

    .line 66
    :cond_3
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_RGB:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v0

    .line 70
    :cond_4
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_AUDIO:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_5

    return-object v0

    .line 73
    :cond_5
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->VMSF_DELTA:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMStandardFilters;->equals(I)Z

    move-result p0

    if-eqz p0, :cond_6

    return-object v0

    :cond_6
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/unpack/vm/VMStandardFilters;
    .locals 1

    .line 26
    const-class v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/unpack/vm/VMStandardFilters;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/unpack/vm/VMStandardFilters;
    .locals 1

    .line 26
    sget-object v0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->$VALUES:[Lcom/github/junrar/unpack/vm/VMStandardFilters;

    invoke-virtual {v0}, [Lcom/github/junrar/unpack/vm/VMStandardFilters;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/unpack/vm/VMStandardFilters;

    return-object v0
.end method


# virtual methods
.method public equals(I)Z
    .locals 1

    .line 47
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->filter:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getFilter()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMStandardFilters;->filter:I

    return v0
.end method
