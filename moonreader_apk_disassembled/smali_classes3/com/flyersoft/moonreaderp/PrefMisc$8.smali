.class Lcom/flyersoft/moonreaderp/PrefMisc$8;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
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

    .line 458
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$8;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 461
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_Misc()V

    const/4 p1, 0x0

    .line 462
    sput p1, Lcom/flyersoft/tools/A;->prefmp:I

    .line 463
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$8;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->initView()V

    .line 464
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$8;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ScrollView;

    invoke-virtual {p2, p1, p1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method
