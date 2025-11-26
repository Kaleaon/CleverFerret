.class public final enum Lcom/vladsch/flexmark/util/format/options/ListSpacing;
.super Ljava/lang/Enum;
.source "ListSpacing.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/ListSpacing;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/ListSpacing;

.field public static final enum AS_IS:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

.field public static final enum LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

.field public static final enum LOOSEN:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

.field public static final enum TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

.field public static final enum TIGHTEN:Lcom/vladsch/flexmark/util/format/options/ListSpacing;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const-string v1, "AS_IS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const-string v3, "LOOSEN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSEN:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const-string v5, "TIGHTEN"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHTEN:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const-string v7, "LOOSE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 8
    new-instance v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const-string v9, "TIGHT"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    const/4 v9, 0x5

    .line 3
    new-array v9, v9, [Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/ListSpacing;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/ListSpacing;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/ListSpacing;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    return-object v0
.end method
