.class public final enum Lcom/vladsch/flexmark/util/format/TableSectionType;
.super Ljava/lang/Enum;
.source "TableSectionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/TableSectionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/TableSectionType;

.field public static final enum BODY:Lcom/vladsch/flexmark/util/format/TableSectionType;

.field public static final enum CAPTION:Lcom/vladsch/flexmark/util/format/TableSectionType;

.field public static final enum HEADER:Lcom/vladsch/flexmark/util/format/TableSectionType;

.field public static final enum SEPARATOR:Lcom/vladsch/flexmark/util/format/TableSectionType;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableSectionType;

    const-string v1, "HEADER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/TableSectionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableSectionType;->HEADER:Lcom/vladsch/flexmark/util/format/TableSectionType;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/TableSectionType;

    const-string v3, "SEPARATOR"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/TableSectionType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->SEPARATOR:Lcom/vladsch/flexmark/util/format/TableSectionType;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/TableSectionType;

    const-string v5, "BODY"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/TableSectionType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/TableSectionType;->BODY:Lcom/vladsch/flexmark/util/format/TableSectionType;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/TableSectionType;

    const-string v7, "CAPTION"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/TableSectionType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/TableSectionType;->CAPTION:Lcom/vladsch/flexmark/util/format/TableSectionType;

    const/4 v7, 0x4

    .line 3
    new-array v7, v7, [Lcom/vladsch/flexmark/util/format/TableSectionType;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/vladsch/flexmark/util/format/TableSectionType;->$VALUES:[Lcom/vladsch/flexmark/util/format/TableSectionType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/TableSectionType;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/TableSectionType;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/TableSectionType;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableSectionType;->$VALUES:[Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/TableSectionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/TableSectionType;

    return-object v0
.end method
