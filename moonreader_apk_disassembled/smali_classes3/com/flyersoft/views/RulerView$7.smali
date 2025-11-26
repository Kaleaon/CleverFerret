.class Lcom/flyersoft/views/RulerView$7;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

    .line 625
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 628
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result p1

    if-eqz p1, :cond_1

    xor-int/lit8 p1, p2, 0x1

    .line 629
    sput-boolean p1, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    .line 630
    sget-boolean p1, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-eqz p1, :cond_0

    .line 631
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smresetRulerImageHeight()V

    .line 632
    :cond_0
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smhideRulerImageIfNeed()V

    .line 633
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smshowRulerSample()V

    :cond_1
    return-void
.end method
