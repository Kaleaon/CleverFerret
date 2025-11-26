.class public Lcom/radaee/util/PDFThumbGrid;
.super Landroid/app/Activity;
.source "PDFThumbGrid.java"


# static fields
.field public static mDoc:Lcom/radaee/pdf/Document;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    sget p1, Lcom/radaee/viewlib/R$layout;->thumb_grid_view:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFThumbGrid;->setContentView(I)V

    .line 25
    sget p1, Lcom/radaee/viewlib/R$id;->thumb_view:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFThumbGrid;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/radaee/util/PDFThumbView;

    .line 26
    sget-object v1, Lcom/radaee/util/PDFThumbGrid;->mDoc:Lcom/radaee/pdf/Document;

    new-instance v2, Lcom/radaee/util/PDFThumbGrid$1;

    invoke-direct {v2, p0}, Lcom/radaee/util/PDFThumbGrid$1;-><init>(Lcom/radaee/util/PDFThumbGrid;)V

    sget p1, Lcom/radaee/pdf/Global;->thumbGridElementHeight:I

    int-to-float p1, p1

    .line 32
    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbGrid;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v3

    float-to-int v3, p1

    sget v5, Lcom/radaee/pdf/Global;->thumbGridBgColor:I

    sget v6, Lcom/radaee/pdf/Global;->thumbGridElementGap:I

    const/4 v4, 0x3

    .line 26
    invoke-virtual/range {v0 .. v6}, Lcom/radaee/util/PDFThumbView;->thumbOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFViewThumb$PDFThumbListener;IIII)V

    return-void
.end method
