.class Lcom/flyersoft/moonreaderp/ActivityMain$33;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
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

    .line 3339
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 3341
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->favExpand:I

    const/4 v2, 0x1

    if-eq v0, v1, :cond_e

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->iv1:I

    if-ne v0, v1, :cond_0

    goto/16 :goto_1

    .line 3346
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->removeAdButton:I

    if-ne v0, v1, :cond_1

    .line 3347
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showAdFreeOptions()V

    .line 3349
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->button0:I

    const/4 v3, 0x0

    if-ne v0, v1, :cond_2

    .line 3350
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 3352
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->button1:I

    if-ne v0, v1, :cond_4

    .line 3353
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->favList:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3

    .line 3355
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    goto :goto_0

    .line 3357
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 3359
    :cond_4
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->button2:I

    if-ne v0, v1, :cond_5

    .line 3360
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 3362
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->button3:I

    if-ne v0, v1, :cond_6

    .line 3363
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 3365
    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->button4:I

    if-ne v0, v1, :cond_7

    .line 3366
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 3368
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->continueLay:I

    if-ne v0, v1, :cond_8

    .line 3369
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoContinueReading(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 3371
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->optionsLay:I

    if-ne v0, v1, :cond_9

    .line 3372
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showOptionsWindow(Ljava/lang/String;)V

    .line 3374
    :cond_9
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->aboutLay:I

    if-ne v0, v1, :cond_a

    .line 3375
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->showAboutDialog(Landroid/app/Activity;Z)Lcom/flyersoft/moonreaderp/PrefAbout;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->prefAbout:Lcom/flyersoft/moonreaderp/PrefAbout;

    .line 3378
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->dayLay:I

    if-ne v0, v1, :cond_b

    .line 3379
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveLastFileItem(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 3380
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    xor-int/2addr v0, v2

    sput-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    .line 3381
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateMainTheme(Z)V

    .line 3382
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->logo:Lcom/flyersoft/views/AlphaImageView;

    invoke-virtual {v0}, Lcom/flyersoft/views/AlphaImageView;->postInvalidate()V

    .line 3384
    :cond_b
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->exitLay:I

    if-ne v0, v1, :cond_c

    .line 3385
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveLastSub(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 3386
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mexitProgram(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 3388
    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->dayLay:I

    if-eq v0, v1, :cond_d

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->continueLay:I

    if-eq p1, v0, :cond_d

    .line 3389
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->startDrawer:Landroid/widget/FrameLayout;

    sget-boolean v1, Lcom/flyersoft/tools/A;->eink:Z

    xor-int/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->closeDrawer(Landroid/view/View;Z)V

    :cond_d
    return-void

    .line 3342
    :cond_e
    :goto_1
    sget-boolean p1, Lcom/flyersoft/tools/A;->favoriteOnDrawer:Z

    xor-int/2addr p1, v2

    sput-boolean p1, Lcom/flyersoft/tools/A;->favoriteOnDrawer:Z

    .line 3343
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$33;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetFavoriteOnDrawer(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
