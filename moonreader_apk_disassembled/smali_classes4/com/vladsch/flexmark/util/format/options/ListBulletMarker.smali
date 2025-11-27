.class public final enum Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;
.super Ljava/lang/Enum;
.source "ListBulletMarker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

.field public static final enum ANY:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

.field public static final enum ASTERISK:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

.field public static final enum DASH:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

.field public static final enum PLUS:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    const-string v1, "ANY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    const-string v3, "DASH"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->DASH:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    const-string v5, "ASTERISK"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ASTERISK:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    const-string v7, "PLUS"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->PLUS:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    const/4 v7, 0x4

    .line 3
    new-array v7, v7, [Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    return-object v0
.end method
