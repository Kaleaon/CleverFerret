.class public Lcom/vladsch/flexmark/util/format/TableSeparatorSection;
.super Lcom/vladsch/flexmark/util/format/TableSection;
.source "TableSeparatorSection.java"


# static fields
.field public static final DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

.field public static final NULL_CELL:Lcom/vladsch/flexmark/util/format/TableCell;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    const/4 v1, 0x0

    const-string v2, ""

    const/4 v3, 0x1

    invoke-direct {v0, v2, v3, v1}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;II)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableSeparatorSection;->NULL_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    .line 5
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    const-string v1, "---"

    invoke-direct {v0, v1, v3, v3}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;II)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableSeparatorSection;->DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/format/TableSection;-><init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V

    return-void
.end method


# virtual methods
.method public defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    .line 18
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableSeparatorSection;->DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-object v0
.end method

.method public defaultRow()Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    .line 13
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableSeparatorRow;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/format/TableSeparatorRow;-><init>()V

    return-object v0
.end method
