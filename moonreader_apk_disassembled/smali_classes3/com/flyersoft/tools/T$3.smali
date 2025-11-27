.class Lcom/flyersoft/tools/T$3;
.super Ljava/lang/Object;
.source "T.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/T;->textViewSetTextFade(Landroid/widget/TextView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$newText:Ljava/lang/String;

.field final synthetic val$tv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3387
    iput-object p1, p0, Lcom/flyersoft/tools/T$3;->val$tv:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/flyersoft/tools/T$3;->val$newText:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 3390
    iget-object v0, p0, Lcom/flyersoft/tools/T$3;->val$tv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/tools/T$3;->val$newText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3391
    iget-object v0, p0, Lcom/flyersoft/tools/T$3;->val$tv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xb4

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    return-void
.end method
