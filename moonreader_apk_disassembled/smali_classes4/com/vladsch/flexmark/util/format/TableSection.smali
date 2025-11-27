.class public Lcom/vladsch/flexmark/util/format/TableSection;
.super Ljava/lang/Object;
.source "TableSection.java"


# instance fields
.field protected column:I

.field protected row:I

.field public final rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;"
        }
    .end annotation
.end field

.field public final sectionType:Lcom/vladsch/flexmark/util/format/TableSectionType;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    .line 13
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/TableSection;->sectionType:Lcom/vladsch/flexmark/util/format/TableSectionType;

    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    .line 16
    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    return-void
.end method

.method private dumpRows()Ljava/lang/CharSequence;
    .locals 4

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 104
    const-string v3, "  "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/TableRow;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    .line 76
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableCell;->NULL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-object v0
.end method

.method public defaultRow()Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    .line 72
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableRow;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/format/TableRow;-><init>()V

    return-object v0
.end method

.method public expandTo(I)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/TableSection;->expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p1

    return-object p1
.end method

.method public expandTo(II)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/format/TableSection;->expandTo(IILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p1

    return-object p1
.end method

.method public expandTo(IILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 2

    .line 63
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableSection;->defaultRow()Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object v0

    .line 65
    invoke-virtual {v0, p2, p3}, Lcom/vladsch/flexmark/util/format/TableRow;->expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;

    .line 66
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 68
    :cond_0
    iget-object p3, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableRow;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/format/TableRow;->expandTo(I)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p1

    return-object p1
.end method

.method public expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    .line 51
    :goto_0
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lt p1, p2, :cond_0

    .line 52
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableSection;->defaultRow()Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p2

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 55
    :cond_0
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableRow;

    return-object p1
.end method

.method public get(I)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    const/4 v0, 0x0

    .line 80
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/TableSection;->expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p1

    return-object p1
.end method

.method public getColumn()I
    .locals 1

    .line 28
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    return v0
.end method

.method public getMaxColumns()I
    .locals 3

    .line 85
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 86
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/TableRow;->getSpannedColumns()I

    move-result v2

    if-ge v1, v2, :cond_0

    move v1, v2

    goto :goto_0

    :cond_1
    return v1
.end method

.method public getMinColumns()I
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 95
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/TableRow;->getSpannedColumns()I

    move-result v2

    if-gt v1, v2, :cond_1

    if-nez v1, :cond_0

    :cond_1
    move v1, v2

    goto :goto_0

    :cond_2
    return v1
.end method

.method public getRow()I
    .locals 1

    .line 24
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    return v0
.end method

.method public getRows()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;"
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    return-object v0
.end method

.method public nextRow()V
    .locals 1

    .line 32
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    return-void
.end method

.method public normalize()V
    .locals 2

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 42
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableRow;->normalize()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCell(IILcom/vladsch/flexmark/util/format/TableCell;)V
    .locals 0

    .line 37
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableSection;->expandTo(I)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Lcom/vladsch/flexmark/util/format/TableRow;->set(ILcom/vladsch/flexmark/util/format/TableCell;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "[sectionType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableSection;->sectionType:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", rows=[\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/format/TableSection;->dumpRows()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
