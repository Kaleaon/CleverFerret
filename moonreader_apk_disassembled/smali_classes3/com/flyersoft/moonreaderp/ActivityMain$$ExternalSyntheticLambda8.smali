.class public final synthetic Lcom/flyersoft/moonreaderp/ActivityMain$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field public final synthetic f$1:Lcom/flyersoft/components/MyMenu;


# direct methods
.method public synthetic constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/components/MyMenu;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$$ExternalSyntheticLambda8;->f$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$$ExternalSyntheticLambda8;->f$1:Lcom/flyersoft/components/MyMenu;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$$ExternalSyntheticLambda8;->f$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$$ExternalSyntheticLambda8;->f$1:Lcom/flyersoft/components/MyMenu;

    invoke-virtual {v0, v1, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->lambda$showFavoriteFolders$3$com-flyersoft-moonreaderp-ActivityMain(Lcom/flyersoft/components/MyMenu;Landroid/view/View;)V

    return-void
.end method
