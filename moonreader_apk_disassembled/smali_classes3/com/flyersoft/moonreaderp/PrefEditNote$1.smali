.class Lcom/flyersoft/moonreaderp/PrefEditNote$1;
.super Ljava/lang/Object;
.source "PrefEditNote.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditNote;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditNote;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$1;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 141
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$1;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setCursorVisible(Z)V

    return-void
.end method
