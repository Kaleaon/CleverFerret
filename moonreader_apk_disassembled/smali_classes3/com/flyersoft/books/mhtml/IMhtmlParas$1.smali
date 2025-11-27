.class synthetic Lcom/flyersoft/books/mhtml/IMhtmlParas$1;
.super Ljava/lang/Object;
.source "IMhtmlParas.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/mhtml/IMhtmlParas;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 158
    invoke-static {}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->values()[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas$1;->$SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I

    :try_start_0
    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->CSS:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-virtual {v1}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas$1;->$SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->GIF:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-virtual {v1}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas$1;->$SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->PNG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-virtual {v1}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas$1;->$SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->JPEG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-virtual {v1}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas$1;->$SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->HTML:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-virtual {v1}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    return-void
.end method
