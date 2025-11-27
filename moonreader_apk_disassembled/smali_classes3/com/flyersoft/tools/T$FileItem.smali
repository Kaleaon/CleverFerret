.class public Lcom/flyersoft/tools/T$FileItem;
.super Ljava/lang/Object;
.source "T.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileItem"
.end annotation


# instance fields
.field public date:J

.field public fullname:Ljava/lang/String;

.field private imageRes:I

.field public name:Ljava/lang/String;

.field public size:J

.field public sortItem:Lcom/flyersoft/tools/T$NatureSortItem;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IJJ)V
    .locals 0

    .line 3416
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3417
    iput-object p1, p0, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    .line 3418
    iput-object p2, p0, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    .line 3419
    iput p3, p0, Lcom/flyersoft/tools/T$FileItem;->imageRes:I

    .line 3420
    iput-wide p4, p0, Lcom/flyersoft/tools/T$FileItem;->date:J

    .line 3421
    iput-wide p6, p0, Lcom/flyersoft/tools/T$FileItem;->size:J

    return-void
.end method


# virtual methods
.method public getImageRes()I
    .locals 2

    .line 3431
    iget v0, p0, Lcom/flyersoft/tools/T$FileItem;->imageRes:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 3432
    iget-object v0, p0, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getFileIcon(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/tools/T$FileItem;->imageRes:I

    .line 3433
    :cond_0
    iget v0, p0, Lcom/flyersoft/tools/T$FileItem;->imageRes:I

    return v0
.end method

.method public getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;
    .locals 1

    .line 3425
    iget-object v0, p0, Lcom/flyersoft/tools/T$FileItem;->sortItem:Lcom/flyersoft/tools/T$NatureSortItem;

    if-nez v0, :cond_0

    .line 3426
    iget-object v0, p0, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->createNatureSortItem(Ljava/lang/String;)Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/tools/T$FileItem;->sortItem:Lcom/flyersoft/tools/T$NatureSortItem;

    .line 3427
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/T$FileItem;->sortItem:Lcom/flyersoft/tools/T$NatureSortItem;

    return-object v0
.end method
