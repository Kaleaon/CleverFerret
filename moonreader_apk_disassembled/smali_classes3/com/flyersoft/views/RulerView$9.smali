.class Lcom/flyersoft/views/RulerView$9;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 651
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    if-eqz p3, :cond_1

    .line 654
    invoke-static {p2}, Lcom/flyersoft/views/RulerView;->saveRulerAlpha(I)V

    .line 655
    sget-boolean p1, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-nez p1, :cond_0

    .line 656
    sget p1, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result p1

    sget p3, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-static {p3}, Landroid/graphics/Color;->green(I)I

    move-result p3

    sget v0, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {p2, p1, p3, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    sput p1, Lcom/flyersoft/views/RulerView;->rulerColor:I

    .line 657
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "value: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p3, 0x0

    aput-object p1, p2, p3

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 658
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smshowRulerSample()V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
