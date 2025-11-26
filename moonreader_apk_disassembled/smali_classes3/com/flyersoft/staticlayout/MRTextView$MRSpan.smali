.class Lcom/flyersoft/staticlayout/MRTextView$MRSpan;
.super Ljava/lang/Object;
.source "MRTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MRTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MRSpan"
.end annotation


# instance fields
.field end:I

.field paint:Landroid/text/TextPaint;

.field start:I

.field text:Ljava/lang/String;

.field width:F

.field x:F

.field y:F


# direct methods
.method public constructor <init>(Ljava/lang/String;FFLandroid/text/TextPaint;II)V
    .locals 0

    .line 1070
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1071
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->text:Ljava/lang/String;

    .line 1072
    iput p2, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->x:F

    .line 1073
    iput p3, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->y:F

    .line 1074
    iput-object p4, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->paint:Landroid/text/TextPaint;

    .line 1075
    iput p5, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->start:I

    .line 1076
    iput p6, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpan;->end:I

    return-void
.end method
