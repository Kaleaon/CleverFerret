.class Lcom/flyersoft/moonreaderp/PrefOptions$5;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefOptions;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 293
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$5;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 2

    .line 295
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$5;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$5;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return v1
.end method
