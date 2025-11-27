.class public final enum Lcom/github/junrar/unpack/decode/FilterType;
.super Ljava/lang/Enum;
.source "FilterType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/unpack/decode/FilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_AUDIO:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_DELTA:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_E8:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_E8E9:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_E8E9V2:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_ITANIUM:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_NONE:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_PPM:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_RGB:Lcom/github/junrar/unpack/decode/FilterType;

.field public static final enum FILTER_UPCASETOLOW:Lcom/github/junrar/unpack/decode/FilterType;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 27
    new-instance v0, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v1, "FILTER_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_NONE:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v1, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v3, "FILTER_PPM"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_PPM:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v3, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v5, "FILTER_E8"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_E8:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v5, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v7, "FILTER_E8E9"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_E8E9:Lcom/github/junrar/unpack/decode/FilterType;

    .line 28
    new-instance v7, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v9, "FILTER_UPCASETOLOW"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_UPCASETOLOW:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v9, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v11, "FILTER_AUDIO"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_AUDIO:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v11, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v13, "FILTER_RGB"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_RGB:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v13, Lcom/github/junrar/unpack/decode/FilterType;

    const-string v15, "FILTER_DELTA"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_DELTA:Lcom/github/junrar/unpack/decode/FilterType;

    .line 29
    new-instance v15, Lcom/github/junrar/unpack/decode/FilterType;

    const/16 v17, 0x7

    const-string v2, "FILTER_ITANIUM"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_ITANIUM:Lcom/github/junrar/unpack/decode/FilterType;

    new-instance v2, Lcom/github/junrar/unpack/decode/FilterType;

    const/16 v19, 0x8

    const-string v4, "FILTER_E8E9V2"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/github/junrar/unpack/decode/FilterType;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/github/junrar/unpack/decode/FilterType;->FILTER_E8E9V2:Lcom/github/junrar/unpack/decode/FilterType;

    const/16 v4, 0xa

    .line 26
    new-array v4, v4, [Lcom/github/junrar/unpack/decode/FilterType;

    aput-object v0, v4, v16

    aput-object v1, v4, v18

    aput-object v3, v4, v20

    aput-object v5, v4, v8

    aput-object v7, v4, v10

    aput-object v9, v4, v12

    aput-object v11, v4, v14

    aput-object v13, v4, v17

    aput-object v15, v4, v19

    aput-object v2, v4, v6

    sput-object v4, Lcom/github/junrar/unpack/decode/FilterType;->$VALUES:[Lcom/github/junrar/unpack/decode/FilterType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/unpack/decode/FilterType;
    .locals 1

    .line 26
    const-class v0, Lcom/github/junrar/unpack/decode/FilterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/unpack/decode/FilterType;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/unpack/decode/FilterType;
    .locals 1

    .line 26
    sget-object v0, Lcom/github/junrar/unpack/decode/FilterType;->$VALUES:[Lcom/github/junrar/unpack/decode/FilterType;

    invoke-virtual {v0}, [Lcom/github/junrar/unpack/decode/FilterType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/unpack/decode/FilterType;

    return-object v0
.end method
