.class public Lcom/vladsch/flexmark/util/format/TableCaptionSection;
.super Lcom/vladsch/flexmark/util/format/TableSection;
.source "TableCaptionSection.java"


# static fields
.field public static final DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

.field public static final NULL_CELL:Lcom/vladsch/flexmark/util/format/TableCell;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 6
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableCaptionSection;->NULL_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    .line 7
    new-instance v1, Lcom/vladsch/flexmark/util/format/TableCell;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const-string v2, "["

    const-string v3, ""

    const-string v4, "]"

    invoke-direct/range {v1 .. v6}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/TableCaptionSection;->DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/format/TableSection;-><init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V

    return-void
.end method


# virtual methods
.method public defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableCaptionSection;->DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-object v0
.end method

.method public defaultRow()Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    .line 15
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCaptionRow;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/format/TableCaptionRow;-><init>()V

    return-object v0
.end method
