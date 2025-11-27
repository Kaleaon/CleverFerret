.class Lcom/flyersoft/moonreaderp/PrefFontPick$12$1;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick$12;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$12;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick$12;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 419
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 422
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$12;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$12;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->scrollTo(II)V

    return-void
.end method
