.class public final enum Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;
.super Ljava/lang/Enum;
.source "ParsedOptionStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

.field public static final enum ERROR:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

.field public static final enum IGNORED:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

.field public static final enum VALID:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

.field public static final enum WARNING:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

.field public static final enum WEAK_WARNING:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;


# instance fields
.field private final level:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    const-string v1, "VALID"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->VALID:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    const-string v3, "IGNORED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->IGNORED:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    const-string v5, "WEAK_WARNING"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->WEAK_WARNING:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    const-string v7, "WARNING"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->WARNING:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    .line 8
    new-instance v7, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    const-string v9, "ERROR"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->ERROR:Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    const/4 v9, 0x5

    .line 3
    new-array v9, v9, [Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->$VALUES:[Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 13
    iput p3, p0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->level:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->$VALUES:[Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;

    return-object v0
.end method


# virtual methods
.method escalate(Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;)Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;
    .locals 2

    .line 17
    iget v0, p0, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->level:I

    iget v1, p1, Lcom/vladsch/flexmark/util/options/ParsedOptionStatus;->level:I

    if-ge v0, v1, :cond_0

    return-object p1

    :cond_0
    return-object p0
.end method
