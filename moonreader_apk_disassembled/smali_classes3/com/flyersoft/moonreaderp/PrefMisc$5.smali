.class Lcom/flyersoft/moonreaderp/PrefMisc$5;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->loadSettings()V
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

    .line 337
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$5;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 339
    sput-boolean p2, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    .line 340
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$5;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->bluelightLay:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sget-boolean p2, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/16 p2, 0x8

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 341
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$5;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->bluelightLay2:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sget-boolean p2, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
