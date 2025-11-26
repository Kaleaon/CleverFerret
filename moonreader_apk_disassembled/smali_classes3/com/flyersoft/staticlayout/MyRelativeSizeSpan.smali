.class public Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;
.super Landroid/text/style/RelativeSizeSpan;
.source "MyRelativeSizeSpan.java"


# instance fields
.field public fontSize:F

.field public inherited:Z


# direct methods
.method public constructor <init>(F)V
    .locals 1

    .line 26
    invoke-direct {p0, p1}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    .line 27
    iput p1, p0, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->fontSize:F

    return-void
.end method
