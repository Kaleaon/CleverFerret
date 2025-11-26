.class Lcom/radaee/annotui/UIColorButton$6;
.super Ljava/lang/Object;
.source "UIColorButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIColorButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIColorButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIColorButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 124
    iput-object p1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 127
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$400(Lcom/radaee/annotui/UIColorButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->isShowing()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x2

    .line 128
    new-array p1, p1, [I

    .line 129
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UIColorButton;->getLocationInWindow([I)V

    .line 130
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$id;->tog_enable:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 131
    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v1}, Lcom/radaee/annotui/UIColorButton;->access$100(Lcom/radaee/annotui/UIColorButton;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 132
    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v1}, Lcom/radaee/annotui/UIColorButton;->access$500(Lcom/radaee/annotui/UIColorButton;)Z

    move-result v1

    const/16 v2, 0x8

    if-eqz v1, :cond_0

    .line 133
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setVisibility(I)V

    .line 134
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$id;->txt_enable:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 135
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$400(Lcom/radaee/annotui/UIColorButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {}, Lcom/radaee/annotui/UIColorButton;->access$600()F

    move-result v3

    const/high16 v4, 0x41f00000    # 30.0f

    sub-float/2addr v3, v4

    invoke-static {v1, v3}, Lcom/radaee/annotui/UIColorButton;->access$700(Lcom/radaee/annotui/UIColorButton;F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setHeight(I)V

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v1}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 140
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/radaee/annotui/UIColorButton;->access$302(Lcom/radaee/annotui/UIColorButton;I)I

    .line 141
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$id;->seek_clr_r:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 142
    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v1}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object v1

    sget v3, Lcom/radaee/viewlib/R$id;->seek_clr_g:I

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    .line 143
    iget-object v3, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v3}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object v3

    sget v4, Lcom/radaee/viewlib/R$id;->seek_clr_b:I

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/SeekBar;

    .line 144
    iget-object v4, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v4}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v4

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v0, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 145
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v0

    shr-int/2addr v0, v2

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 146
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v3, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 147
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {v0}, Lcom/radaee/annotui/UIColorButton;->access$400(Lcom/radaee/annotui/UIColorButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    const/4 v2, 0x0

    aget v2, p1, v2

    invoke-virtual {v1}, Lcom/radaee/annotui/UIColorButton;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/radaee/annotui/UIColorButton$6;->this$0:Lcom/radaee/annotui/UIColorButton;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v3, v4}, Lcom/radaee/annotui/UIColorButton;->access$700(Lcom/radaee/annotui/UIColorButton;F)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x1

    aget p1, p1, v3

    invoke-virtual {v0, v1, v2, p1}, Lcom/radaee/annotui/UIAnnotPop;->show(Landroid/view/View;II)V

    :cond_1
    return-void
.end method
