.class public Lcom/flyersoft/components/MyDialog;
.super Ljava/lang/Object;
.source "MyDialog.java"


# static fields
.field public static dialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/MyDialog;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public dlg:Landroidx/appcompat/app/AlertDialog;

.field mCancelable:Z

.field mCheckedItem:I

.field mCheckedItems:[Z

.field mContext:Landroid/content/Context;

.field mIcon:Landroid/graphics/drawable/Drawable;

.field mIconId:I

.field mIsMultiChoice:Z

.field mIsSingleChoice:Z

.field mItems:[Ljava/lang/CharSequence;

.field mLayoutParams:Landroid/view/WindowManager$LayoutParams;

.field mMessage:Ljava/lang/CharSequence;

.field mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field mNegativeButtonText:Ljava/lang/CharSequence;

.field mNeutralButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field mNeutralButtonText:Ljava/lang/CharSequence;

.field mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

.field mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

.field mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field mPaddingBottom:I

.field mPaddingLeft:I

.field mPaddingRight:I

.field mPaddingTop:I

.field mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field mPositiveButtonText:Ljava/lang/CharSequence;

.field mTitle:Ljava/lang/CharSequence;

.field mView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 54
    iput v0, p0, Lcom/flyersoft/components/MyDialog;->mCheckedItem:I

    const/4 v1, 0x1

    .line 56
    iput-boolean v1, p0, Lcom/flyersoft/components/MyDialog;->mCancelable:Z

    .line 64
    iput v0, p0, Lcom/flyersoft/components/MyDialog;->mPaddingLeft:I

    iput v0, p0, Lcom/flyersoft/components/MyDialog;->mPaddingRight:I

    iput v0, p0, Lcom/flyersoft/components/MyDialog;->mPaddingTop:I

    iput v0, p0, Lcom/flyersoft/components/MyDialog;->mPaddingBottom:I

    .line 70
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static dismissAll()V
    .locals 4

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "dismissAll dialogs:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 30
    sget-object v0, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_1

    .line 31
    sget-object v1, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 32
    sget-object v1, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 34
    :cond_1
    sget-object v0, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method private getContext()Landroid/content/Context;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 75
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/MyDialog;->mContext:Landroid/content/Context;

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static hideNavigation()V
    .locals 3

    .line 38
    sget-object v0, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/MyDialog;

    if-eqz v1, :cond_0

    .line 39
    iget-object v2, v1, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    if-eqz v2, :cond_0

    .line 40
    iget-boolean v1, v1, Lcom/flyersoft/components/MyDialog;->mCancelable:Z

    if-nez v1, :cond_0

    .line 41
    invoke-static {v2}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static setDialogButtonDynamicColor(Landroidx/appcompat/app/AlertDialog;)V
    .locals 3

    if-nez p0, :cond_0

    goto :goto_1

    .line 212
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_4

    .line 214
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->textColorSecondary2:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/tools/C;->textColorSecondary:I

    :goto_0
    const/4 v1, -0x1

    .line 215
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 216
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setTextColor(I)V

    :cond_2
    const/4 v1, -0x2

    .line 217
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 218
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setTextColor(I)V

    :cond_3
    const/4 v1, -0x3

    .line 219
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 220
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    :cond_4
    :goto_1
    return-void
.end method

.method public static setDialogDynamicBackground(Landroid/app/Dialog;)V
    .locals 2

    if-eqz p0, :cond_2

    .line 199
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 201
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    .line 202
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->round_dialog:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 203
    invoke-static {}, Lcom/flyersoft/tools/C;->dialogColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 204
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 206
    :cond_1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {}, Lcom/flyersoft/tools/C;->dialogColor()I

    move-result v0

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->createShapDrawable(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 98
    :try_start_0
    sget-object v0, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    .line 99
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 102
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/MyDialog;->hideNavigation()V

    .line 103
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefOptions;->hideNavigation()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 105
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public setCancelable(Z)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 296
    iput-boolean p1, p0, Lcom/flyersoft/components/MyDialog;->mCancelable:Z

    return-object p0
.end method

.method public setIcon(I)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 276
    iput p1, p0, Lcom/flyersoft/components/MyDialog;->mIconId:I

    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 281
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 91
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mItems:[Ljava/lang/CharSequence;

    .line 92
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setLayoutParams(Landroid/view/WindowManager$LayoutParams;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 301
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    return-object p0
.end method

.method public setMessage(I)Lcom/flyersoft/components/MyDialog;
    .locals 1

    .line 261
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mMessage:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 266
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mMessage:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 336
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mItems:[Ljava/lang/CharSequence;

    .line 337
    iput-object p3, p0, Lcom/flyersoft/components/MyDialog;->mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 338
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mCheckedItems:[Z

    const/4 p1, 0x1

    .line 339
    iput-boolean p1, p0, Lcom/flyersoft/components/MyDialog;->mIsMultiChoice:Z

    return-object p0
.end method

.method public setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 1

    .line 249
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 250
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 255
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 256
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 1

    .line 237
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mNeutralButtonText:Ljava/lang/CharSequence;

    .line 238
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mNeutralButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 243
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mNeutralButtonText:Ljava/lang/CharSequence;

    .line 244
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mNeutralButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 286
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 291
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public setPaddingBottom(I)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 321
    iput p1, p0, Lcom/flyersoft/components/MyDialog;->mPaddingBottom:I

    return-object p0
.end method

.method public setPaddingLeft(I)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 306
    iput p1, p0, Lcom/flyersoft/components/MyDialog;->mPaddingLeft:I

    return-object p0
.end method

.method public setPaddingRight(I)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 311
    iput p1, p0, Lcom/flyersoft/components/MyDialog;->mPaddingRight:I

    return-object p0
.end method

.method public setPaddingTop(I)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 316
    iput p1, p0, Lcom/flyersoft/components/MyDialog;->mPaddingTop:I

    return-object p0
.end method

.method public setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 1

    .line 225
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 226
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 231
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 232
    iput-object p2, p0, Lcom/flyersoft/components/MyDialog;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 327
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mItems:[Ljava/lang/CharSequence;

    .line 328
    iput p2, p0, Lcom/flyersoft/components/MyDialog;->mCheckedItem:I

    .line 329
    iput-object p3, p0, Lcom/flyersoft/components/MyDialog;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    const/4 p1, 0x1

    .line 330
    iput-boolean p1, p0, Lcom/flyersoft/components/MyDialog;->mIsSingleChoice:Z

    return-object p0
.end method

.method public setTitle(I)Lcom/flyersoft/components/MyDialog;
    .locals 1

    .line 80
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mTitle:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mTitle:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;
    .locals 0

    .line 271
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    return-object p0
.end method

.method public show()Landroidx/appcompat/app/AlertDialog;
    .locals 7

    .line 111
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->mItems:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 112
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->alertDialogDynamicColor(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/MyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    .line 113
    :goto_0
    iget-boolean v1, p0, Lcom/flyersoft/components/MyDialog;->mCancelable:Z

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 114
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mTitle:Ljava/lang/CharSequence;

    if-eqz v1, :cond_1

    .line 115
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 116
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mItems:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_4

    .line 117
    iget-boolean v2, p0, Lcom/flyersoft/components/MyDialog;->mIsSingleChoice:Z

    if-eqz v2, :cond_2

    .line 118
    iget v2, p0, Lcom/flyersoft/components/MyDialog;->mCheckedItem:I

    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto/16 :goto_5

    .line 119
    :cond_2
    iget-boolean v2, p0, Lcom/flyersoft/components/MyDialog;->mIsMultiChoice:Z

    if-eqz v2, :cond_3

    .line 120
    iget-object v2, p0, Lcom/flyersoft/components/MyDialog;->mCheckedItems:[Z

    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    invoke-virtual {v0, v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto/16 :goto_5

    .line 122
    :cond_3
    iget-object v2, p0, Lcom/flyersoft/components/MyDialog;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto/16 :goto_5

    .line 123
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mMessage:Ljava/lang/CharSequence;

    if-eqz v1, :cond_5

    .line 124
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto/16 :goto_5

    .line 125
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    if-eqz v1, :cond_c

    .line 126
    invoke-static {v1}, Lcom/flyersoft/tools/A;->forceTextColors(Landroid/view/View;)V

    .line 127
    iget v1, p0, Lcom/flyersoft/components/MyDialog;->mPaddingLeft:I

    const/high16 v2, 0x41c00000    # 24.0f

    const/4 v3, -0x1

    if-eq v1, v3, :cond_6

    goto :goto_1

    :cond_6
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    .line 128
    :goto_1
    iget v4, p0, Lcom/flyersoft/components/MyDialog;->mPaddingTop:I

    if-eq v4, v3, :cond_7

    goto :goto_2

    :cond_7
    const/high16 v4, 0x41900000    # 18.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    .line 129
    :goto_2
    iget v5, p0, Lcom/flyersoft/components/MyDialog;->mPaddingRight:I

    if-eq v5, v3, :cond_8

    goto :goto_3

    :cond_8
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    .line 130
    :goto_3
    iget v2, p0, Lcom/flyersoft/components/MyDialog;->mPaddingBottom:I

    if-eq v2, v3, :cond_9

    goto :goto_4

    :cond_9
    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    .line 131
    :goto_4
    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    instance-of v6, v3, Landroid/view/ViewGroup;

    if-eqz v6, :cond_b

    .line 132
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->transparentLay:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_a

    const/4 v6, 0x0

    .line 134
    invoke-virtual {v3, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 135
    :cond_a
    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    add-int/2addr v1, v3

    .line 136
    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    add-int/2addr v4, v3

    .line 137
    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    add-int/2addr v5, v3

    .line 138
    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    .line 139
    iget-object v3, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v3, v1, v4, v5, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 140
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto :goto_5

    .line 142
    :cond_b
    new-instance v3, Landroid/widget/FrameLayout;

    iget-object v6, p0, Lcom/flyersoft/components/MyDialog;->mContext:Landroid/content/Context;

    invoke-direct {v3, v6}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 143
    invoke-virtual {v3, v1, v4, v5, v2}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 144
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mView:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 145
    invoke-virtual {v0, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 148
    :cond_c
    :goto_5
    iget v1, p0, Lcom/flyersoft/components/MyDialog;->mIconId:I

    if-eqz v1, :cond_d

    .line 149
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setIcon(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 150
    :cond_d
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_e

    .line 151
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setIcon(Landroid/graphics/drawable/Drawable;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 152
    :cond_e
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v1, :cond_f

    .line 153
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 154
    :cond_f
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mPositiveButtonText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_10

    .line 155
    iget-object v2, p0, Lcom/flyersoft/components/MyDialog;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 156
    :cond_10
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mNeutralButtonText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_11

    .line 157
    iget-object v2, p0, Lcom/flyersoft/components/MyDialog;->mNeutralButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 158
    :cond_11
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mNegativeButtonText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_12

    .line 159
    iget-object v2, p0, Lcom/flyersoft/components/MyDialog;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 161
    :cond_12
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    .line 162
    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v1, :cond_13

    .line 163
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/components/MyDialog;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 164
    :cond_13
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    new-instance v1, Lcom/flyersoft/components/MyDialog$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyDialog$1;-><init>(Lcom/flyersoft/components/MyDialog;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 172
    iget-boolean v0, p0, Lcom/flyersoft/components/MyDialog;->mCancelable:Z

    if-nez v0, :cond_14

    .line 173
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    .line 174
    :cond_14
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 175
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->sysAlertDialogWidth()I

    move-result v1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    invoke-static {v0}, Lcom/flyersoft/components/MyDialog;->setDialogDynamicBackground(Landroid/app/Dialog;)V

    .line 186
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    invoke-static {v0}, Lcom/flyersoft/components/MyDialog;->setDialogButtonDynamicColor(Landroidx/appcompat/app/AlertDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    .line 188
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 191
    :goto_6
    sget-object v0, Lcom/flyersoft/components/MyDialog;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    return-object v0
.end method
