.class Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13979
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 13982
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FavFolderAdapter;->checked:[Z

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aput-boolean p2, v0, p1

    return-void
.end method
