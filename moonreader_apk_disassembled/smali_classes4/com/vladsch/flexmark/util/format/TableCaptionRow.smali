.class public Lcom/vladsch/flexmark/util/format/TableCaptionRow;
.super Lcom/vladsch/flexmark/util/format/TableRow;
.source "TableCaptionRow.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/format/TableRow;-><init>()V

    return-void
.end method


# virtual methods
.method public defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    .line 7
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableCaptionSection;->NULL_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-object v0
.end method
