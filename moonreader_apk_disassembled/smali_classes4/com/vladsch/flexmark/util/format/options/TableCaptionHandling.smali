.class public final enum Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;
.super Ljava/lang/Enum;
.source "TableCaptionHandling.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

.field public static final enum ADD:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

.field public static final enum AS_IS:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

.field public static final enum REMOVE:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

.field public static final enum REMOVE_EMPTY:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    const-string v1, "AS_IS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->AS_IS:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    const-string v3, "ADD"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ADD:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    const-string v5, "REMOVE_EMPTY"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->REMOVE_EMPTY:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    const-string v7, "REMOVE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->REMOVE:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    const/4 v7, 0x4

    .line 3
    new-array v7, v7, [Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    return-object v0
.end method
