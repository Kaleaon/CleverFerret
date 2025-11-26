.class Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;
.super Ljava/lang/Object;
.source "AnimalTools.java"

# interfaces
.implements Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$repeat:Z

.field final synthetic val$size:F

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;ZF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 39
    iput-object p1, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$view:Landroid/view/View;

    iput-boolean p2, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$repeat:Z

    iput p3, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$size:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 42
    iget-object p1, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$view:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 43
    iget-boolean p1, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$repeat:Z

    if-eqz p1, :cond_0

    .line 44
    iget-object p1, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$view:Landroid/view/View;

    iget p3, p0, Lcom/flyersoft/tools/miscellaneous/AnimalTools$1;->val$size:F

    invoke-static {p1, p3, p2}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V

    :cond_0
    return-void
.end method
