.class Lcom/facebook/soloader/Elf32$Phdr;
.super Ljava/lang/Object;
.source "Elf32.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/soloader/Elf32;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Phdr"
.end annotation


# static fields
.field public static final P_ALIGN:I = 0x1c

.field public static final P_FILESZ:I = 0x10

.field public static final P_FLAGS:I = 0x18

.field public static final P_MEMSZ:I = 0x14

.field public static final P_OFFSET:I = 0x4

.field public static final P_PADDR:I = 0xc

.field public static final P_TYPE:I = 0x0

.field public static final P_VADDR:I = 0x8


# direct methods
.method constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
