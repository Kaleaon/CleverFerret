.class Lcom/flyersoft/views/RulerView$10$1;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView$10;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/RulerView$10;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RulerView$10;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 677
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$10$1;->this$0:Lcom/flyersoft/views/RulerView$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 679
    sget v0, Lcom/flyersoft/views/RulerView;->rulerColor:I

    if-eq p1, v0, :cond_2

    .line 680
    sput p1, Lcom/flyersoft/views/RulerView;->rulerColor:I

    .line 681
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    if-eqz v0, :cond_1

    .line 682
    :cond_0
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    invoke-static {p1}, Lcom/flyersoft/views/RulerView;->saveRulerAlpha(I)V

    .line 683
    :cond_1
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smshowRulerSample()V

    :cond_2
    return-void
.end method
