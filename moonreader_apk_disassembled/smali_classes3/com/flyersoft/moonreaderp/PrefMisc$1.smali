.class Lcom/flyersoft/moonreaderp/PrefMisc$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 195
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 198
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 199
    sget-boolean v1, Lcom/flyersoft/tools/A;->eink:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 200
    sget v1, Lcom/flyersoft/tools/A;->prefmp:I

    invoke-virtual {v0, v2, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void

    .line 202
    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->prefmp:I

    invoke-virtual {v0, v2, v1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method
