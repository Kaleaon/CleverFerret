.class Lcom/radaee/annotui/UIColorButton$5;
.super Ljava/lang/Object;
.source "UIColorButton.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

    .line 104
    iput-object p1, p0, Lcom/radaee/annotui/UIColorButton$5;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 107
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$5;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$300(Lcom/radaee/annotui/UIColorButton;)I

    move-result p3

    and-int/lit16 p3, p3, -0x100

    or-int/2addr p2, p3

    invoke-static {p1, p2}, Lcom/radaee/annotui/UIColorButton;->access$302(Lcom/radaee/annotui/UIColorButton;I)I

    .line 108
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$5;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object p1

    iget-object p2, p0, Lcom/radaee/annotui/UIColorButton$5;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p2}, Lcom/radaee/annotui/UIColorButton;->access$300(Lcom/radaee/annotui/UIColorButton;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
