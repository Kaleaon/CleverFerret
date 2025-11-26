.class public Lcom/flyersoft/staticlayout/MRTextView$MarginF;
.super Ljava/lang/Object;
.source "MRTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MRTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MarginF"
.end annotation


# instance fields
.field public bottom:F

.field public indent:F

.field public indentSp:Lcom/flyersoft/staticlayout/MyMarginSpan;

.field public left:F

.field public right:F

.field final synthetic this$0:Lcom/flyersoft/staticlayout/MRTextView;

.field public top:F


# direct methods
.method public constructor <init>(Lcom/flyersoft/staticlayout/MRTextView;FFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 1896
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->this$0:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1897
    iput p2, p0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 1898
    iput p3, p0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->top:F

    .line 1899
    iput p4, p0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    .line 1900
    iput p5, p0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->bottom:F

    .line 1901
    iput p6, p0, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->indent:F

    return-void
.end method
