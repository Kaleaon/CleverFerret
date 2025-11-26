.class public final enum Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;
.super Ljava/lang/Enum;
.source "ListNumberedMarker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

.field public static final enum ANY:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

.field public static final enum DOT:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

.field public static final enum PAREN:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    const-string v1, "ANY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    const-string v3, "DOT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->DOT:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    const-string v5, "PAREN"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->PAREN:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    const/4 v5, 0x3

    .line 3
    new-array v5, v5, [Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    return-object v0
.end method
