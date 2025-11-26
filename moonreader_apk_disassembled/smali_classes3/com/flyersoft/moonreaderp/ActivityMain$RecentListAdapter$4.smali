.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11252
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 11254
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 11255
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v1, :cond_0

    .line 11256
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->inverseChecked(I)V

    return-void

    .line 11259
    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 11260
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 11261
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void
.end method
