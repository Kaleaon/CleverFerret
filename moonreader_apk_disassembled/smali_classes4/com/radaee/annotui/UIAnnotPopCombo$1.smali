.class Lcom/radaee/annotui/UIAnnotPopCombo$1;
.super Ljava/lang/Object;
.source "UIAnnotPopCombo.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotPopCombo;->update(Lcom/radaee/pdf/Page$Annotation;[F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotPopCombo;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotPopCombo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 37
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo$1;->this$0:Lcom/radaee/annotui/UIAnnotPopCombo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 40
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo$1;->this$0:Lcom/radaee/annotui/UIAnnotPopCombo;

    invoke-static {p1, p3}, Lcom/radaee/annotui/UIAnnotPopCombo;->access$002(Lcom/radaee/annotui/UIAnnotPopCombo;I)I

    .line 41
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo$1;->this$0:Lcom/radaee/annotui/UIAnnotPopCombo;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPopCombo;->dismiss()V

    return-void
.end method
