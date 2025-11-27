.class Lcom/radaee/annotui/UIAnnotPopEdit$2;
.super Ljava/lang/Object;
.source "UIAnnotPopEdit.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotPopEdit;->update(Lcom/radaee/pdf/Page$Annotation;[FF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotPopEdit;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotPopEdit;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 79
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit$2;->this$0:Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x6

    if-ne p2, p1, :cond_0

    .line 83
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit$2;->this$0:Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPopEdit;->dismiss()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
