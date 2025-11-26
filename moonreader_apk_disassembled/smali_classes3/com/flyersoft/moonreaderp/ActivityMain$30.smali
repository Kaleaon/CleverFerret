.class Lcom/flyersoft/moonreaderp/ActivityMain$30;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroidx/drawerlayout/widget/DrawerLayout$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initDrawerLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3205
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .locals 1

    .line 3215
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->drawerToggle:Landroidx/appcompat/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBarDrawerToggle;->onDrawerOpened(Landroid/view/View;)V

    .line 3216
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    const/16 v0, 0x3e8

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 3217
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetFavoriteOnDrawer(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .locals 1

    .line 3210
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->drawerToggle:Landroidx/appcompat/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1, p2}, Landroidx/appcompat/app/ActionBarDrawerToggle;->onDrawerSlide(Landroid/view/View;F)V

    const p1, 0x3e99999a    # 0.3f

    cmpg-float p1, p2, p1

    if-gez p1, :cond_0

    .line 3212
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    const/16 p2, 0x3e8

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method public onDrawerStateChanged(I)V
    .locals 1

    .line 3207
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$30;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->drawerToggle:Landroidx/appcompat/app/ActionBarDrawerToggle;

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBarDrawerToggle;->onDrawerStateChanged(I)V

    return-void
.end method
