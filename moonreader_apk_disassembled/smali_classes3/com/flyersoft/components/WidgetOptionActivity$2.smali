.class Lcom/flyersoft/components/WidgetOptionActivity$2;
.super Ljava/lang/Object;
.source "WidgetOptionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/WidgetOptionActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/WidgetOptionActivity;

.field final synthetic val$rg:Landroid/widget/RadioGroup;

.field final synthetic val$styleGroup:Landroid/widget/RadioGroup;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/WidgetOptionActivity;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iput-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$rg:Landroid/widget/RadioGroup;

    iput-object p3, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$styleGroup:Landroid/widget/RadioGroup;

    iput-object p4, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    .line 124
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$rg:Landroid/widget/RadioGroup;

    invoke-virtual {p2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/RadioGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p1, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    .line 125
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$styleGroup:Landroid/widget/RadioGroup;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    .line 126
    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$v:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->r0:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$v:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->r1:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->val$v:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->r2:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne p1, v0, :cond_2

    const/4 p1, 0x2

    goto :goto_0

    :cond_2
    const/4 p1, 0x3

    :goto_0
    iput p1, p2, Lcom/flyersoft/components/WidgetOptionActivity;->style:I

    .line 130
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget-object p1, p1, Lcom/flyersoft/components/WidgetOptionActivity;->items:[Ljava/lang/String;

    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget p2, p2, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    aget-object p1, p1, p2

    .line 131
    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget p2, p2, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    const/4 v0, -0x1

    if-nez p2, :cond_3

    .line 132
    const-string p1, "#0"

    goto :goto_1

    .line 133
    :cond_3
    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget p2, p2, Lcom/flyersoft/components/WidgetOptionActivity;->selected:I

    const-string v3, "("

    if-ne p2, v1, :cond_5

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-eq p2, v0, :cond_4

    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    .line 134
    invoke-virtual {p2, v4}, Lcom/flyersoft/components/WidgetOptionActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-eq p2, v0, :cond_5

    .line 135
    :cond_4
    const-string p1, "#1"

    goto :goto_1

    .line 137
    :cond_5
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    add-int/2addr p2, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p1, p2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 139
    :goto_1
    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    const-string v1, "widget"

    invoke-virtual {p2, v1, v2}, Lcom/flyersoft/components/WidgetOptionActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget v3, v3, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget v1, v1, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "_style"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget v1, v1, Lcom/flyersoft/components/WidgetOptionActivity;->style:I

    .line 140
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 141
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget-boolean p1, p1, Lcom/flyersoft/components/WidgetOptionActivity;->fromStartConfig:Z

    if-eqz p1, :cond_6

    .line 142
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    invoke-static {p1, v2}, Lcom/flyersoft/tools/A;->updateWidget(Landroid/content/Context;Z)V

    .line 143
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 144
    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget p2, p2, Lcom/flyersoft/components/WidgetOptionActivity;->id:I

    const-string v1, "appWidgetId"

    invoke-virtual {p1, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 145
    iget-object p2, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    invoke-virtual {p2, v0, p1}, Lcom/flyersoft/components/WidgetOptionActivity;->setResult(ILandroid/content/Intent;)V

    goto :goto_2

    .line 148
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    invoke-static {p1, v2}, Lcom/flyersoft/tools/A;->updateWidget(Landroid/content/Context;Z)V

    .line 150
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$2;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    invoke-virtual {p1}, Lcom/flyersoft/components/WidgetOptionActivity;->finish()V

    return-void
.end method
